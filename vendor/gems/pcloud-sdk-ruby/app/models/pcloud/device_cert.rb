module Pcloud
  class DeviceCert < ApplicationModel

    permit_primary_key :serial
    permit_attributes  :serial, :vendor_id, :created_at, :updated_at, :description, :cert_file, :content

    validates :description, presence: true

    class << self

      def all
        client = DeviceCertClient.new
        response = client.list_device_certs
        response['data'].map do |device_crt|
          record = DeviceCert.new
          record.assign_attributes(device_crt)
          record
        end
      end

      def find(serial)
        client = Pcloud::DeviceCertClient.new
        response = client.get_device_cert(serial: serial)
        record = DeviceCert.new
        record.assign_attributes(response['data'])
        record
      end
    end # class << self

    def save
      run_callbacks :save do
        if valid?
          client = Pcloud::DeviceCertClient.new
          response = if new_record?
            client.create_device_cert(attributes)
          else
            client.put_device_cert(attributes)
          end
          assign_attributes(response['data'])
          changes_applied
          true
        else
          false
        end
      end
    rescue => e
      self.api_error_message = begin
        JSON.parse(e.response.body)['message']
      rescue
        I18n.t('common.messages.error')
      end
      false
    end # save

  end
end
