module OAuth
  module GitHub
    def self.authorize_url
      "https://github.com/login/oauth/authorize?client_id=#{ GITHUB_CLIENT_ID }"
    end
  end
end
