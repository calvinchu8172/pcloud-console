module Push
  class Notification < ApplicationModel
    permit_primary_key :notification_id
    permit_attributes :notification_id, :email, :title, :body, :app_ids, :job_description,
      :localizations, :access_key_id, :user_ids, :gcm_payload,
      :apns_payload, :apns_sandbox_payload, :api_key, :job_id, :total_ids, :total,
      :created_at, :updated_at


    class << self

      def send_personal(options = {})
        client = NotificationClient.new(options["access_key_id"], options["private_key"])
        # options.assign_attributes(app_ids: options["app_ids"].join(','))
        options["app_ids"] = options["app_ids"].reject{ |e| e.empty? }.join(',')
        # options["user_ids"] = "APNS_SANDBOX_USER_ID,GCM_USER_ID"
        options["user_ids"] = options["email"].reject{ |e| e.empty? }.join(',')
        # binding.pry
        response = client.personal(options)
        record = Notification.new
        # binding.pry
        record.assign_attributes(response['data'])
        record
      end


      def select_options(apps)
        apps.map{ |app| [app.name, app.id] }
      end

    end

  end
end