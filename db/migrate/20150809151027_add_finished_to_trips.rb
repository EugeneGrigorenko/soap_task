class AddFinishedToTrips < ActiveRecord::Migration
  def change
    add_column :trips, :finished, :boolean, default: false
  end
end
