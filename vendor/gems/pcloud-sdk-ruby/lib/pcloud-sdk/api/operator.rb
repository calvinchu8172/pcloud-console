require 'rest-client'
require 'json'

module Pcloud
  module Api
    class Operator
      include Swaggerable
      include CertificateSerialable

      def initialize(options)
        options.each do |key, value|
          instance_variable_set("@#{key}", value)
        end
      end

      # 執行 api
      def perform!
        # 進行驗證
        validate_certificate_serial
        assign_certificate_serial
        validate_parameters
        # 透過 RestClient 執行 api
        response = RestClient::Request.execute(rest_client_options)
        # 取得 response body 並轉換為 Hash
        JSON.parse(response.body) rescue nil
      # rescue => e
      #   binding.pry
      end
    end
  end
end
