require 'cuba'
require 'cuba/contrib'

Cuba.plugin Cuba::Mote

Cuba.use Rack::Static,
  urls: %w(/css /img),
  root: './public'

Cuba.define do
  on root do
    res.write partial('statics/home')
  end
end
