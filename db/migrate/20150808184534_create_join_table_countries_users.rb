class CreateJoinTableCountriesUsers < ActiveRecord::Migration
  def change
    create_table :countries_users_relations do |t|
      t.references :country, index: true, foreign_key: true
      t.references :user,    index: true, foreign_key: true
    end
  end
end
