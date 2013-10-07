module GitHub
  def self.fetch_access_token code
    Requests.post(GITHUB_OAUTH_ACCESS_TOKEN,
      data: {
        client_id: GITHUB_CLIENT_ID,
        client_secret: GITHUB_CLIENT_SECRET,
        code: code
      },
      headers: { 'Accept' => 'application/json' }
    ).json['access_token']
  end

  def self.fetch_user token
    Requests.get(GITHUB_FETCH_USER, params: { access_token: token }).json
  end

  def self.oauth_authorize_url
    "#{ GITHUB_OAUTH_AUTHORIZE }?client_id=#{ GITHUB_CLIENT_ID }"
  end
end
