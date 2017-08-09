module UserDeIdentifiable
  extend ActiveSupport::Concern

  included do

    def cloud_id
      @cloud_id ||= self.class.encrypt_cloud_id(id)
    end
  end

  class_methods do

    def find_by_cloud_id(cloud_id)
      find_by(id: decrypt_cloud_id(cloud_id))
    rescue
      nil
    end

    def encrypt_cloud_id(id)
      aes = OpenSSL::Cipher.new('AES-256-CBC')
      aes.encrypt
      aes.pkcs5_keyivgen(Rails.application.secrets.secret_key_base)
      "z#{Base64.urlsafe_encode64(aes.update(id.to_s) + aes.final)}"
    end

    def decrypt_cloud_id(cloud_id)
      cloud_id = Base64.urlsafe_decode64(cloud_id[1..-1])
      aes = OpenSSL::Cipher.new('AES-256-CBC')
      aes.decrypt
      aes.pkcs5_keyivgen(Rails.application.secrets.secret_key_base)
      (aes.update(cloud_id) + aes.final).to_i
    end
  end
end
