require 'bundler/setup'
require 'sinatra'
require 'omniauth-bitrix24'

class OmniBitrixDemo < Sinatra::Base
  use Rack::Session::Cookie
  use OmniAuth::Builder do
    provider :bitrix24, 'https://myportal.bitrix24.ru', '<<<client_id>>>', '<<<client_secret>>>' 
  end

  get '/' do
     <<-HTML
      <a href='/auth/bitrix24'>Sign in</a>      
      HTML
  end

  get '/auth/bitrix24/callback' do
    <<-HTML
      <img src="#{request.env['omniauth.auth'].info.image}" width=64></img>
      Hello, <strong>#{request.env['omniauth.auth'].info.name}!</strong>
    HTML
  end

  get '/auth/bitrix24/failure' do
    "Sorry, but something went wrong :("
  end
end

OmniBitrixDemo.run!