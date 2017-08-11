require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Myzyxel < OmniAuth::Strategies::OAuth2

      option :name, :myzyxel

      option :client_options, {
        site: Rails.configuration.omniauth_myzyxel[:provider_url],
        authorize_url: '/oauth/authorize'
      }

      # uid { user_info['info']['account_id'] }

      # info { user_info['info'] }

      # def request_phase
      #   redirect client.auth_code.authorize_url(
      #     { redirect_uri: callback_url }.merge(authorize_params).merge(request.params)
      #   )
      # end

      # def user_info
      #   @user_info ||= JSON.parse(Aescrypt::decrypt(
      #     Rails.configuration.omniauth_myzyxel[:client_secret],
      #     access_token.get('/api/v1/my/info').parsed['result']
      #   ))
      # end

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
