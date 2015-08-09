class Currency < ActiveRecord::Base
  validates :code, length: { maximum: 3 }

  has_many :countries

  scope :by_name, -> { order(:name) }
  scope :countries_users_reference, -> { references(:countries_users_relations) }

  def self.with_countries_and_visits(user_id)
    includes(countries: :countries_users_relations)
      .where('countries_users_relations.user_id = (?) OR
              countries_users_relations.user_id IS NULL', user_id)
  end

  def not_visited_countries_size
    visited_count = countries.to_a.count do |country|
      country.countries_users_relations.any?
    end
    countries.size - visited_count
  end
end
