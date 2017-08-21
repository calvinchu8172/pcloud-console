module Pcloud
  class ConsoleClient < Client
    class << self
      def swagger_yml
        "#{Pcloud::API_DIR}/console/#{self.client_name}/api.yml"
      end
    end

    def host
      ENV['PCLOUD_API_HOST']
    end

    def certificate_serial
      ENV['CERTIFICATE_SERIAL']
    end

    def private_key
      ENV['PCLOUD_PRIVATE_KEY']
    end
  end
end
