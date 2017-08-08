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

    # Andy 原來的
    # def access_key_id
    #   ENV['NOTIFICATION_ACCESS_KEY_ID']
    # end

    # def private_key
    #   ENV['NOTIFICATION_PRIVATE_KEY']
    # end
    # Andy 原來的

    # Calvin 修改的
    def initialize(access_key_id, private_key)
      @access_key_id = access_key_id
      @private_key = private_key
    end

    def access_key_id
      # ENV['NOTIFICATION_ACCESS_KEY_ID']
      @access_key_id
    end

    def private_key
      # ENV['NOTIFICATION_PRIVATE_KEY']
      @private_key
    end
    # Calvin 修改的

  end
end
