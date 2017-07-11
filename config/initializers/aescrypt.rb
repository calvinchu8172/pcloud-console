class Aescrypt

  class << self

    def encrypt(key, data, urlsafe = false)
      iv = SecureRandom.base64(12)
      encrypted_data = aes256_encrypt(key, data, iv)
      encrypted_data = iv + Base64.strict_encode64(encrypted_data)
      encrypted_data = Base64.urlsafe_encode64(encrypted_data) if urlsafe
      encrypted_data
    end

    def decrypt(key, encrypted_data, urlsafe = false)
      encrypted_data = Base64.urlsafe_decode64(encrypted_data) if urlsafe
      iv = encrypted_data[0..15]
      encrypted_data = Base64.strict_decode64(encrypted_data[16..-1])
      aes256_decrypt(key, encrypted_data, iv)
    end

    def aes256_encrypt(key, data, iv = nil)
      key = Digest::SHA256.digest(key) if key.kind_of?(String) && key.bytesize != 32
      aes = OpenSSL::Cipher.new('AES-256-CBC')
      aes.encrypt
      aes.key = key
      aes.iv  = iv if iv
      aes.update(data) + aes.final
    end

    def aes256_decrypt(key, encrypted_data, iv = nil)
      key = Digest::SHA256.digest(key) if key.kind_of?(String) && key.bytesize != 32
      aes = OpenSSL::Cipher.new('AES-256-CBC')
      aes.decrypt
      aes.key = key
      aes.iv  = iv if iv
      aes.update(encrypted_data) + aes.final
    end
  end
end
