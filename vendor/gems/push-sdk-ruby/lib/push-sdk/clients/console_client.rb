module Push
  class ConsoleClient < Client
    class << self
      def swagger_yml
        "#{Push::API_DIR}/console/#{self.client_name}/api.yml"
      end
    end

    def host
      ENV['PUSH_CONSOLE_HOST']
    end

    def api_key
      ENV['CONSOLE_API_KEY']
    end

    def access_key_id
      ENV['CONSOLE_ACCESS_KEY_ID']
    end

    def private_key
      ENV['CONSOLE_PRIVATE_KEY']
    end
  end
end
