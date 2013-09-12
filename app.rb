require 'cuba'
require 'cuba/contrib'

Cuba.plugin Cuba::Mote

Dir['./routes/**/*.rb'].each { |f| require f }

Cuba.define do
  on default do
    run Statics
  end
end
