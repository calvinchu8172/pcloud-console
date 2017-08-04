module Push
  class AccessKey < ApplicationModel

    permit_primary_key :access_key_id
    permit_attributes :access_key_id, :name, :description,
      :public_key, :status, :type, :app_group_id, :app_group_topic_arn,
      :app_topic_arn, :application_arn, :platform,
      :app_id, :created_at, :updated_at

    class << self

      def where(options = {})
        client = AccessKeyClient.new
        response = client.send(where_operator(options), options)
        response['data'].map do |access_key|
          record = AccessKey.new
          record.assign_attributes(access_key)
          record
        end
      end

      def find_by(options = {})
        client = AccessKeyClient.new
        response = client.send(find_by_operator(options), options)
        record = AccessKey.new
        record.assign_attributes(response['data'])
        record
      end

      def where_operator(options = {})
        unless options[:app_id]
          'list_app_group_access_keys'
        else
          'list_app_access_keys'
        end
      end

      def find_by_operator(options = {})
        unless options[:app_id]
          'get_app_group_access_key'
        else
          'get_app_access_key'
        end
      end

      def status_radio_options
        ['active', 'inactive'].map do |status|
          [I18n.t("common.labels.#{status}"), status]
        end
      end
    end

    def download_url
      client = AccessKeyClient.new
      response = client.send(get_download_url, api_options)
      response.dig('data', 'download_url')
    end

    def get_download_url
      unless api_options[:app_id]
        'get_app_group_access_key_download_url'
      else
        'get_app_access_key_download_url'
      end
    end

    def localized_status
      I18n.t("common.labels.#{self.status}")
    end

    def active?
      self.status == 'active'
    end

    def inactive?
      self.status == 'inactive'
    end

    def revoked!
      update(status: 'revoked')
    end

    def revoked?
      self.status == 'revoked'
    end

    # 1. validate attributes
    # 2. return boolean
    def save
      run_callbacks :save do
        if valid?
          client = AccessKeyClient.new
          response = if new_record?
            client.send(create_operator(api_options), api_options)
          else
            client.send(update_operator(api_options), api_options)
          end
          assign_attributes(response['data'])
          changes_applied
          true
        else
          false
        end
      end
    end

    def api_options
      @api_options = attributes
      @api_options[:id] = @api_options.delete(:access_key_id)
      @api_options
    end

    def create_operator(options = {})
      unless options[:app_id]
        'create_app_group_access_key'
      else
        'create_app_access_key'
      end
    end

    def update_operator(options = {})
      unless options[:app_id]
        'put_app_group_access_key'
      else
        'put_app_access_key'
      end
    end
  end
end
