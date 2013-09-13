class User < Ohm::Model
  include Ohm::DataTypes

  attribute :username
  attribute :name
  attribute :email
  attribute :url
  attribute :avatar
end
