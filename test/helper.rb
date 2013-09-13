require 'cuba/test'
require_relative '../app'

class Cutest::Scope
  alias :response :last_response
end
