require 'cuba'
require 'cuba/contrib'
require 'ohm'
require 'ohm/contrib'

REDIS_URL = ENV.fetch 'REDIS_URL'

Cuba.plugin Cuba::Mote

Ohm.connect url: REDIS_URL

Dir['./models/**/*.rb'].each { |f| require f }

Cuba.use Rack::Static,
  urls: %w(/css /img),
  root: './public'

Cuba.define do
  on root do
    res.write partial('statics/home')
  end
end
