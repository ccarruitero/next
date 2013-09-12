require 'cuba'
require 'cuba/contrib'

Cuba.plugin Cuba::Mote

Dir['./routes/**/*.rb'].each { |f| require f }

Cuba.use Rack::Static,
  urls: %w(/css /img),
  root: './public'

Cuba.define do
  on default do
    run Statics
  end
end
