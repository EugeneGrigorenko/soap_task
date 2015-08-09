class CountriesUsersRelation < ActiveRecord::Base
  belongs_to :user
  belongs_to :country

  validates :user_id, presence: true
  validates :country_id, presence: true, uniqueness: { scope: :user_id }
end
