module Push
  class AccessKey < ApplicationModel

    permit_attributes :access_key_id, :name, :description,
    :public_key, :status, :type, :app_group_id, :app_group_topic_arn,
    :app_id, :created_at, :updated_at
    permit_primary_key :access_key_id

    validates :name, presence: true

    class << self

      def all(app_group_id)
        client = AccessKeyClient.new
        response = client.list_app_group_access_keys(app_group_id: app_group_id)
        response['data'].map do |access_key|
          record = AccessKey.new
          record.assign_attributes(access_key)
          record
        end
      end

      def find(app_access_key_id)
        client = AccessKeyClient.new
        response = client.get_app_group(app_group_id: app_group_id)
        record = AccessKey.new
        record.assign_attributes(response['data'])
        record
      end
    end

    # 1. validate attributes
    # 2. return boolean
    def save
      run_callbacks :save do
        if valid?
          client = AccessKeyClient.new
          options = {
            name: self.name,
            description: self.description
          }
          response = if new_record?
            client.create_app_group(options)
          else
            client.put_app_group(options.merge(
              app_group_id: self.app_group_id
            ))
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
