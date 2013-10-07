class User < Ohm::Model
  attribute :github_id
  attribute :username
  attribute :name
  attribute :email
  attribute :url
  attribute :avatar
  attribute :admin

  unique :github_id

  def admin?
    !!admin
  end
end
