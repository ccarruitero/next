ENV['REDIS_URL'] = 'redis://127.0.0.1:6379/13'

require 'cuba/test'
require_relative '../app'

class Cutest::Scope
  alias :response :last_response
end

prepare do
  Ohm.flush
end
