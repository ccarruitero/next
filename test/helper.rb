ENV['REDIS_URL'] = 'redis://127.0.0.1:6379/13'

require 'cuba/test'
require 'mocoso'
require_relative '../app'

include Mocoso

prepare do
  Ohm.flush
end
