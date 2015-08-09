class CreateJoinTableCountriesTrips < ActiveRecord::Migration
  def change
    create_join_table :countries, :trips do |t|
      t.index [:trip_id, :country_id]
    end
  end
end
