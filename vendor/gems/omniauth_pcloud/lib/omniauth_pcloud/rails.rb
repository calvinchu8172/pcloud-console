require 'omniauth'

module OmniauthPcloud
  class Engine < ::Rails::Engine

    config.before_configuration do |app|
      app.configure do
        config.omniauth_pcloud = config_for(:omniauth_pcloud).deep_symbolize_keys
      end
    end

    initializer 'omniauth_pcloud.strategy', before: 'omniauth_pcloud.devise_setup' do
      OmniAuth.config.logger = Rails.logger
      require 'omniauth/strategies/pcloud'
    end

    initializer 'omniauth_pcloud.devise_setup', before: 'devise.omniauth' do
      Devise.setup do |config|
        config.omniauth :pcloud,
          Rails.configuration.omniauth_pcloud[:client_id],
          Rails.configuration.omniauth_pcloud[:client_secret]
      end
    end
  end
end
