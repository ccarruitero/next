require_relative 'helper'

scope do
  test 'redirects to GitHub oauth authorize url' do
    get '/auth/github'

    follow_redirect!

    assert_equal GitHub.oauth_authorize_url, last_request.url
  end

  test 'redirects to root if access token returned by GitHub is nil' do
    expect GitHub, :fetch_access_token, with: ['whatever'], return: nil do
      get '/auth/github', code: 'whatever'

      assert last_response.redirect?
      assert_equal '/', last_response.location
    end
  end

  test 'redirect to github login if access token return by GitHub is not nil' do
    expect GitHub, :fetch_access_token, with: ['whatever'], return: 'token' do
      get '/auth/github', code: 'whatever'

      assert last_response.redirect?
      assert_equal '/auth/github/token', last_response.location
    end
  end
end
