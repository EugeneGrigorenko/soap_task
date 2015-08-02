class AddCountryToCurrency < ActiveRecord::Migration
  def change
    add_reference :currencies, :country, index: true, foreign_key: true
  end
end
