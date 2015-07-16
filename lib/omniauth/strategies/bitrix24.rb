require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Bitrix24 < OmniAuth::Strategies::OAuth2
      args [:site, :client_id, :client_secret]
      option :site, nil      

      option :token_params, {scope: 'user'}
      
      uid{ raw_info['ID'] }

      info do
        { 
          name: "#{raw_info['NAME']} #{raw_info['LAST_NAME']}", 
          email: raw_info['EMAIL'] ,
          first_name: raw_info['NAME'],
          last_name: raw_info['LAST_NAME'],
          image: raw_info['PERSONAL_PHOTO'],
          phone: raw_info['PERSONAL_PHONE']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= get('/rest/user.current').parsed['result']
      end

      def get(method)
        access_token.get(method, info_options)        
      end

      def info_options
        {
          params: {
            auth: access_token.token
          }
        }        
      end

      def client
        ::OAuth2::Client.new(options.client_id, options.client_secret, deep_symbolize({site: options.site}).merge({token_method: :get}))
      end
    end
  end
end

OmniAuth.config.add_camelization "bitrix24", "Bitrix24"