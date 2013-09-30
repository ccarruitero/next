module GitHub
  def self.authorize_url
    "#{ GITHUB_OAUTH_AUTHORIZE }?client_id=#{ GITHUB_CLIENT_ID }"
  end
end
