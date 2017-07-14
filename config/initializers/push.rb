Rails.application.configure do
  config.push = config_for(:push).deep_symbolize_keys
end

class Push

  def self.timestamp
    (Time.now + 10.minutes).to_i.to_s
  end

  def self.sign(params = {})
    params.merge!(access_key_id: root_access_key_id)
    data = Hash[params.stringify_keys.sort].values.join('')
    digest = OpenSSL::Digest::SHA224.new
    rsa_key = OpenSSL::PKey::RSA.new(root_private_key)
    signature = Base64.strict_encode64(rsa_key.sign(digest, data))
  end

  def self.method_missing(method, *args, &block)
    Rails.configuration.push[method] || 'Unknown'
  end
end
