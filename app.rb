require 'cuba'
require 'cuba/contrib'
require 'ohm'
require 'requests'
require 'requests/sugar'
require './settings'

REDIS_URL = ENV.fetch 'REDIS_URL'
GITHUB_CLIENT_ID = ENV.fetch 'GITHUB_CLIENT_ID'
GITHUB_CLIENT_SECRET = ENV.fetch 'GITHUB_CLIENT_SECRET'
GITHUB_OAUTH_AUTHORIZE = ENV.fetch 'GITHUB_OAUTH_AUTHORIZE'
GITHUB_OAUTH_ACCESS_TOKEN = ENV.fetch 'GITHUB_OAUTH_ACCESS_TOKEN'
GITHUB_FETCH_USER = ENV.fetch 'GITHUB_FETCH_USER'

Cuba.plugin Cuba::Mote

Ohm.redis = Redic.new REDIS_URL

Dir['./lib/**/*.rb'].each    { |f| require f }
Dir['./models/**/*.rb'].each { |f| require f }
Dir['./routes/**/*.rb'].each { |f| require f }

Cuba.use Rack::Static,
  urls: %w(/css /img),
  root: './public'

Cuba.define do
  on root do
    res.write partial('statics/home')
  end

  on 'events' do
    run Events
  end

  on default do
    run Guests
  end
end
