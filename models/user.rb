class User < Ohm::Model
  attribute :username
  attribute :name
  attribute :email
  attribute :url
  attribute :avatar
  attribute :admin

  def admin?
    !!admin
  end
end
