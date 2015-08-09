class Country < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :name, presence: true

  belongs_to :currency
  has_many :countries_users_relations
  has_many :users, through: :countries_users_relations
  has_and_belongs_to_many :trips

  scope :by_code, -> (code) { find_by(code: code) }
  scope :with_currency, -> { includes(:currency) }
end
