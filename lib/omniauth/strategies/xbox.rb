require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Xbox < OmniAuth::Strategies::OAuth2
      option :name, 'xbox'

      option :client_options,
             site: 'https://xbl.io/app',
             authorize_url:'https://xbl.io/app/auth/',
             token_url: '/claim'

      option :authorize_options, %i[scope permissions prompt]
    end
  end
end