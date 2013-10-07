ENV['REDIS_URL'] = 'redis://127.0.0.1:6379/13'

require 'cuba/test'
require 'mocoso'
require_relative '../app'

include Mocoso

class Cutest::Scope
  def assert_match exp, act
    exp = Regexp.new Regexp.escape exp if String === exp and String === act
    flunk "Expected #{exp.inspect} to match #{act.inspect}" unless exp =~ act
    success
  end
end

prepare do
  Ohm.flush
end
