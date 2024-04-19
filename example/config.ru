require 'bundler/setup'
require 'omniauth'
require 'omniauth-xbox'
require 'sinatra'
require "sinatra/reloader"

configure do
  set :sessions, true
  set :run, false
  set :raise_errors, true
end

use Rack::Session::Cookie, secret: '123456789'

use OmniAuth::Builder do
  provider :xbox, ENV['XBOX_PUBLIC_KEY']
end

get '/' do
  content_type 'text/html'
  <<-HTML
    <html>
      <body>
      <form method='post' action='/auth/xbox'>
        <input type="hidden" name="authenticity_token" value='#{request.env["rack.session"]["csrf"]}'>
        <button type='submit'>Login with XBOX</button>
      </form>
      </body>
    </html>
  HTML
end

get '/auth/:provider/callback' do
  content_type 'application/json'
  request.env['omniauth.auth'].to_json
end


run Sinatra::Application