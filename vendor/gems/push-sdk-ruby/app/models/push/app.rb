module Push
  class App < ApplicationModel

    permit_attributes :app_id, :name, :description,
      :application_arn, :platform, :topic_arn, :app_group_id, :bundle_id,
      :package_name, :created_at, :updated_at
    permit_primary_key :app_id

    validates :name, presence: true

    class << self

      def all
        client = AppClient.new
        response = client.list_apps
        response['data'].map do |app|
          record = AppGroup.new
          record.assign_attributes(app)
          record
        end
      end

      def find(app_group_id)
        client = AppClient.new
        response = client.get_app(app_id: app_id)
        record = App.new
        record.assign_attributes(response['data'])
        record
      end
    end

    # 1. validate attributes
    # 2. return boolean
    def save
      run_callbacks :save do
        if valid?
          client = AppClient.new
          response = if new_record?
            client.create_app(attributes)
          else
            client.put_app(attributes)
          end
          assign_attributes(response['data'])
          changes_applied
          true
        else
          false
        end
      end
    end
  end
end


