require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Pcloud < OmniAuth::Strategies::OAuth2

      option :name, :pcloud

      option :client_options, {
        site: Rails.configuration.omniauth_pcloud[:provider_url],
        authorize_url: '/oauth/authorize'
      }

      uid { user_info['id'] }

      info do
        {
          email: user_info['email']
        }
      end

      extra do
        {
          token: access_token.to_hash
        }
      end

      def user_info
        @user_info ||= access_token.get('/api/v1/my/info').parsed
      end

    end
  end
end
