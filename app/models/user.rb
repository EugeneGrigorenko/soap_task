class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  has_many :countries_users_relations
  has_many :visited_countries, through: :countries_users_relations, source: :country
  has_many :trips
end
