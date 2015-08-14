class Country < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :name, presence: true

  belongs_to :currency
  has_many :countries_users_relations
  has_many :users, through: :countries_users_relations
  has_and_belongs_to_many :trips

  scope :by_code, -> (code) { find_by(code: code) }
  scope :with_currency, -> { includes(:currency) }

  def self.not_visited(user_id)
    where.not(id: CountriesUsersRelation.select(:country_id).where(user_id: user_id))

    # RAW SQL
    # Country.find_by_sql("SELECT * FROM countries
    # LEFT JOIN countries_users_relations cur ON countries.id = cur.country_id AND cur.user_id = (?)
    # WHERE cur.id IS NULL", user_id)
  end
end
