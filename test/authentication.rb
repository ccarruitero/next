require_relative 'helper'

scope do
  test 'redirects to GitHub oauth authorize url' do
    get '/auth/github'

    follow_redirect!

    assert_equal GitHub.oauth_authorize_url, last_request.url
  end
end
