module Pcloud
  class DeviceCert < ApplicationModel

    permit_primary_key :id
    permit_attributes :id, :created_at, :serial, :vendor_id, :updated_at, :description, :cert_file, :content

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

      def find(device_crt_id)
        client = Pcloud::DeviceCertClient.new
        response = client.get_device_cert(id: device_crt_id)
        record = DeviceCert.new
        record.assign_attributes(response['data'])
        unless record.created_at.blank?
          record.created_at = DateTime.parse(record.created_at).new_offset('+08:00').to_s
        end
        unless record.updated_at.blank?
          record.updated_at = DateTime.parse(record.updated_at).new_offset('+08:00').to_s
        end
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
    end # save

  end
end
