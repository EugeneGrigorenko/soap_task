class Currency < ActiveRecord::Base
  validates :code, length: { maximum: 3 }

  belongs_to :country
end
