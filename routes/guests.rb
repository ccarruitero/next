class Guests < Cuba
  define do
    on 'auth/github' do
      res.redirect OAuth::GitHub.authorize_url
    end
  end
end
