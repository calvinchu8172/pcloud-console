require 'openssl'
require 'base64'

module Push
  module Api
    class Signature

      def self.generate(private_key, data)
        # 將 data 排序後的值組合成 secret key
        secret_key = Hash[data.sort].values.join('')
        # 產生 signature
        rsa    = OpenSSL::PKey::RSA.new(private_key)
        digest = OpenSSL::Digest::SHA224.new
        Base64.urlsafe_encode64(rsa.sign(digest, secret_key))
      end
    end
  end
end
