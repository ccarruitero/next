class Guests < Cuba
  define do
    on 'auth/github' do
      on param('code') do |code|
        res.redirect '/'
      end

      on default do
        res.redirect GitHub.oauth_authorize_url
      end
    end
  end
end
