class Guests < Cuba
  define do
    on 'auth/github' do
      on param('code') do |code|
        access_token = GitHub.fetch_access_token code

        on access_token.nil? do
          res.redirect '/'
        end

        on default do
          res.redirect "/auth/github/#{ access_token }"
        end
      end

      on :access_token do |access_token|
        github_user = GitHub.fetch_user access_token
        user = User.with :github_id, github_user['id']

        on user.nil? do
          render 'confirm', title: 'User confirmation', github_user: github_user
        end
      end

      on default do
        res.redirect GitHub.oauth_authorize_url
      end
    end
  end
end
