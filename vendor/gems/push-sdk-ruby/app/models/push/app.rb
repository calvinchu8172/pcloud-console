module Push
  class App < ApplicationModel

    permit_primary_key :app_id
    permit_attributes :app_id, :name, :description, :platform, :status,
      :application_arn, :topic_arn, :app_group_id, :app_group_topic_arn,
      :bundle_id, :privateKey, :certificate, :package_name, :api_key,
      :created_at, :updated_at

    validates :name, presence: true
    validates :platform, presence: true
    validates :bundle_id, presence: true, if: Proc.new { |x| x.platform.in? ['APNS', 'APNS_SANDBOX'] }
    validates :privateKey, presence: true, if: Proc.new { |x| x.platform.in? ['APNS', 'APNS_SANDBOX'] }
    validates :certificate, presence: true, if: Proc.new { |x| x.platform.in? ['APNS', 'APNS_SANDBOX'] }
    validates :package_name, presence: true, if: Proc.new { |x| x.platform == 'GCM' }
    validates :api_key, presence: true, if: Proc.new { |x| x.platform == 'GCM' }

    before_save do
      if self.platform == 'GCM'
        self.bundle_id = nil
        self.privateKey = nil
        self.certificate = nil
      end
      if self.platform.in? ['APNS', 'APNS_SANDBOX']
        self.package_name = nil
        self.api_key = nil
      end
    end

    class << self

      def where(options = {})
        client = AppClient.new
        response = client.list_apps(options)
        response['data'].map do |app|
          record = App.new
          record.assign_attributes(app)
          record
        end
      end

      def find_by(options = {})
        client = AppClient.new
        response = client.get_app(options)
        record = App.new
        record.assign_attributes(response['data'])
        record
      end

      def platform_select_options
        ['APNS', 'APNS_SANDBOX', 'GCM'].map do |platform|
          [I18n.t("push.app_group.app.platform.#{platform.downcase}"), platform]
        end
      end
    end

    def localized_platform
      I18n.t("push.app_group.app.platform.#{self.platform.downcase}")
    end

    def localized_status
      I18n.t("common.labels.#{self.status}")
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
    rescue => e
      self.api_error_message = begin
        JSON.parse(e.response.body)['message']
      rescue
        I18n.t('common.messages.error')
      end
      false
    end
  end
end
