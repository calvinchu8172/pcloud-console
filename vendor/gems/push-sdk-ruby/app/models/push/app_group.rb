module Push
  class AppGroup < ApplicationModel

    permit_primary_key :app_group_id
    permit_attributes :app_group_id, :name, :description, :topic_arn,
      :created_at, :updated_at

    validates :name, presence: true

    class << self

      def all
        client = AppGroupClient.new
        response = client.list_app_groups
        response['data'].map do |app_group|
          record = AppGroup.new
          record.assign_attributes(app_group)
          record
        end
      end

      def find(app_group_id)
        client = AppGroupClient.new
        response = client.get_app_group(app_group_id: app_group_id)
        record = AppGroup.new
        record.assign_attributes(response['data'])
        record
      end
    end

    # 1. validate attributes
    # 2. return boolean
    def save
      run_callbacks :save do
        if valid?
          client = AppGroupClient.new
          response = if new_record?
            client.create_app_group(attributes)
          else
            client.put_app_group(attributes)
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
