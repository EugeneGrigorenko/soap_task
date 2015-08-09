class AddCurrencyIdToCountries < ActiveRecord::Migration
  def change
    add_reference :countries, :currency, index: true, foreign_key: true
  end
end
