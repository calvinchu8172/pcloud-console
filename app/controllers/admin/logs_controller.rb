class Admin::LogsController < AdminController

  load_and_authorize_resource

  def index
    @logs = @logs.includes(:source, :target).reverse_order
  end

  def download_csv
    csv_string = CSV.generate do |csv|
      csv << [
        Log.human_attribute_name(:source_type),
        Log.human_attribute_name(:source_ip),
        Log.human_attribute_name(:target_type),
        Log.human_attribute_name(:event),
        Log.human_attribute_name(:created_at)
      ]
      Log.since(begin_time).until(end_time).reverse_order.each do |log|
        csv << [
          log.source.email,
          log.source_ip,
          log.target.try(:email) || (log.extra.present? ? JSON.pretty_generate(log.extra) : nil),
          log.localized_event,
          log.created_at
        ]
      end
    end
    send_data(csv_string, filename: filename, type: 'text/csv; charset=utf-8')
    Log.write(current_user, nil, request.remote_ip, 'download_logs')
  end

  private

  def begin_time
    Time.now - 1.years
  end

  def end_time
    Time.now
  end

  def filename
    "logs-#{Time.now.utc.strftime("%Y-%m-%dT%H%M%SZ")}.csv"
  end
end
