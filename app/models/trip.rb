class Trip < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :countries

  validates :start_date, presence: true
  validates :end_date,   presence: true

  def mark_visited_countries
    return if end_date >= Date.today
    countries.each do |country|
      CountriesUsersRelation.create(country: country, user: user)
    end
    update(finished: true)
  end
end
