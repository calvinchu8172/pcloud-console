module Push
  class AppClient < Client
    class << self

      def access_key_id
        ENV['PUSH_ACCESS_KEY_ID']
      end

      def private_key
        ENV['PUSH_PRIVATE_KEY']
      end

      def swagger_yml
        "#{Push::API_DIR}/app/api.yml"
      end
    end
  end
end
