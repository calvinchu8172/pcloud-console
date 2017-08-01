module Push
  class AccessKeyClient < ConsoleClient
    class << self
      def swagger_yml
        "#{Push::API_DIR}/access_key/api.yml"
      end
    end
  end
end
