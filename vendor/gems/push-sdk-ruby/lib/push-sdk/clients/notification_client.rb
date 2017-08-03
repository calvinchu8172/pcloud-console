module Push
  class NotificationClient < Client
    class << self
      def swagger_yml
        "#{Push::API_DIR}/notification/api.yml"
      end
    end

    def host
      ENV['PUSH_HOST']
    end

    def api_key
      ENV['NOTIFICATION_API_KEY']
    end

    def access_key_id
      ENV['NOTIFICATION_ACCESS_KEY_ID']
    end

    def private_key
      ENV['NOTIFICATION_PRIVATE_KEY']
    end
  end
end
