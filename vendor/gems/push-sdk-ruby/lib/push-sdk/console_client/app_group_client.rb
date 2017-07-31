module Push
  class AppGroupClient < ConsoleClient
    class << self
      def swagger_yml
        "#{Push::API_DIR}/app_group/api.yml"
      end
    end
  end
end
