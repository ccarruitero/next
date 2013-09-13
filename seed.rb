require 'ohm'
require 'ohm/contrib'

REDIS_URL = ENV.fetch 'REDIS_URL'

Ohm.connect url: REDIS_URL

Dir['./models/**/*.rb'].each { |f| require f }

Ohm.flush

User.create username: 'frodsan', name: 'Francesco Rodriguez',
  email: 'lrodriguezsanc@gmail.com', url: 'http://www.frodsan.com/',
  avatar: 'http://s.gravatar.com/avatar/0cd9079e8f5b64c6e9b6a3ad2ade0a5e?s=80',
  admin: true
