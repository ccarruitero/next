require_relative 'helper'

scope do
  test 'hello world' do
    get '/'

    assert last_response.ok?
  end
end
