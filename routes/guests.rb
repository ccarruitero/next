class Guests < Cuba
  define do
    on 'auth/github' do
      res.redirect GitHub.oauth_authorize_url
    end
  end
end
