class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :guid
      t.string :name
      t.string :date_of_birth
      t.string :country_name
      t.timestamps
    end
  end
end
