require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Ecowork < OmniAuth::Strategies::OAuth2

      option :name, :ecowork

      option :client_options, {
        site: ENV['ECOWORK_OAUTH_APP_URL'],
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
        # binding.pry
        # @user_info ||= access_token.get('http://api-pcloud.dev/api/v1/my/info').parsed
        @user_info ||= access_token.get('/api/v1/my/info').parsed
      end
    end
  end
end