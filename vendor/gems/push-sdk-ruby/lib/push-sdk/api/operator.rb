require 'rest-client'
require 'json'

module Push
  module Api
    class Operator
      include Swaggerable
      include AccessKeyable

      def initialize(options)
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      # 執行 api
      def perform!
        # 進行驗證
        validate_access_key_id
        validate_private_key
        assign_access_key_id
        validate_parameters
        # 透過 RestClient 執行 api
        response = RestClient::Request.execute(rest_client_options)
        # 取得 response body 並轉換為 Hash
        JSON.parse(response.body)
      # rescue => e
      #   binding.pry
      end
    end
  end
end
