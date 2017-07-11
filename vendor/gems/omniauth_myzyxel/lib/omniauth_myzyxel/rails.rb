require 'omniauth'

module OmniauthMyzyxel
  class Engine < ::Rails::Engine

    config.before_configuration do |app|
      app.configure do
        config.omniauth_myzyxel = config_for(:omniauth_myzyxel).deep_symbolize_keys
      end
    end

    initializer 'omniauth_myzyxel.strategy', before: 'omniauth_myzyxel.devise_setup' do
      OmniAuth.config.logger = Rails.logger
      require 'omniauth/strategies/myzyxel'
    end

    initializer 'omniauth_myzyxel.devise_setup', before: 'devise.omniauth' do
      Devise.setup do |config|
        config.omniauth :myzyxel,
          Rails.configuration.omniauth_myzyxel[:client_id],
          Rails.configuration.omniauth_myzyxel[:client_secret]
      end
    end
  end
end
