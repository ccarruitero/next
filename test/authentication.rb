require_relative 'helper'

scope do
  test 'redirects to GitHub oauth authorize url' do
    get '/auth/github'

    follow_redirect!

    assert_equal GitHub.oauth_authorize_url, last_request.url
  end

  test 'redirects to root if access token returned by GitHub is nil' do
    get '/auth/github', code: 'whatever'

    follow_redirect!

    assert last_response.ok?
    assert_equal '/', last_request.path
  end
end
