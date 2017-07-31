module Push
  class AppClient < ConsoleClient
    class << self
      def swagger_yml
        "#{Push::API_DIR}/app/api.yml"
      end
    end
  end
end

