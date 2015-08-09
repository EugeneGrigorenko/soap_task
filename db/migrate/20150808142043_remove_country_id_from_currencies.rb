class RemoveCountryIdFromCurrencies < ActiveRecord::Migration
  def change
    remove_reference :currencies, :country, index: true, foreign_key: true
  end
end
