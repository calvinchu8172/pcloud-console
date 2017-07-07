class Admin::LogsController < ApplicationController

  load_and_authorize_resource

  def index
    @logs = Log.includes(:source, :target).all
  end

  def download_csv

    logs = Log.where(created_at: Time.now - 1.years..Time.now).order(id: :desc)
    # logs = Log.where(created_at: Time.now - 12.hours..Time.now).order(id: :desc)

    csv_string = CSV.generate do |csv|
      csv << [
        Log.human_attribute_name(:source_type),
        Log.human_attribute_name(:source_ip),
        Log.human_attribute_name(:target_type),
        Log.human_attribute_name(:event),
        Log.human_attribute_name(:created_at)
      ]
      logs.each do |log|
        csv << [
          log.source.email,
          log.source_ip,
          log.target.try(:email),
          log.localized_event,
          log.created_at
        ]
      end
    end
    send_data(csv_string, filename: filename, type: 'text/csv; charset=utf-8')
  end

  private

  def filename
    "Logs-List-#{Time.now.strftime("%Y%m%d%H%M%S")}.csv"
  end

end
