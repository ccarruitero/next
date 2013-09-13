require 'cuba'
require 'cuba/contrib'
require 'ohm'
require 'ohm/contrib'

REDIS_URL = ENV.fetch 'REDIS_URL'
GITHUB_CLIENT_ID = ENV.fetch 'GITHUB_CLIENT_ID'
GITHUB_CLIENT_SECRET = ENV.fetch 'GITHUB_CLIENT_SECRET'

Cuba.plugin Cuba::Mote

Ohm.connect url: REDIS_URL

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
