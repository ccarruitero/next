require_relative 'helper'

scope do
  test 'hello world' do
    get '/'

    assert response.ok?
  end
end
