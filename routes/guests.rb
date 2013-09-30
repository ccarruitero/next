class Guests < Cuba
  define do
    on 'auth/github' do
      res.redirect GitHub.authorize_url
    end
  end
end
