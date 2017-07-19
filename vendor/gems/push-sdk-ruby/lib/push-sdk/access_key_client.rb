module Push
  class AccessKeyClient < Client
    class << self

      def access_key_id
        ENV['PUSH_ACCESS_KEY_ID']
      end

      def private_key
        ENV['PUSH_PRIVATE_KEY']
      end

      def swagger_yml
        "#{Push::API_DIR}/access_key/api.yml"
      end
    end
  end
end
