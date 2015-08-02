class Country < ActiveRecord::Base
  validates :code, presence: true, uniqueness: true, length: { maximum: 2 }
  validates :name, presence: true

  has_one :currency, dependent: :destroy

  scope :by_code, -> (code) { find_by(code: code) }
  scope :with_currency, -> { includes(:currency) }
end
