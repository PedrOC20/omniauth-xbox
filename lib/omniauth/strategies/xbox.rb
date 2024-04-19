require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Xbox < OmniAuth::Strategies::OAuth2
      option :name, 'xbox'

      option :client_options,
             site: 'https://xbl.io/api/v2',
             authorize_url:"https://xbl.io/app/auth/#{ENV['XBOX_PUBLIC_KEY']}",
             token_url: 'https://xbl.io/app/claim'

      option :authorize_options, %i[permissions prompt]

      uid { raw_info['xuid'] }

      info do
        { 
          email: raw_info['email'],
          avatar: raw_info['avatar']
        }
      end

      extra do
        {
          raw_info: raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("https://xbl.io/api/v2/account").parsed
      end

      def build_access_token
        verifier = request.params['code']
        params = {:redirect_uri => callback_url}.merge(token_params.to_hash(:symbolize_keys => true))
        params[:headers] = {'Content-Type' => 'application/json'}
        params[:body] = {'app_key' => options.public_key, 'code' => verifier}
   
        client.auth_code.get_token(verifier, params, deep_symbolize(options.auth_token_params))

        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts "ACESS_TOKEN"
        puts access_token
      end
    end
  end
end
