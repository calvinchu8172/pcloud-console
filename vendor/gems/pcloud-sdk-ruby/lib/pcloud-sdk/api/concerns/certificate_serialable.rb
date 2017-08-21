module Pcloud
  module Api
    module CertificateSerialable

      attr_accessor :client, :certificate_serial

      # 檢查 private_key
      def validate_certificate_serial
        raise 'Certificate Serial is required' unless client.certificate_serial
        true
      end

      # 配置 access_key_id
      def assign_certificate_serial
        self.certificate_serial = client.certificate_serial
      end
    end
  end
end