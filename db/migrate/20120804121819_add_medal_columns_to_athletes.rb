class AddMedalColumnsToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :gold,   :integer
    add_column :athletes, :silver, :integer
    add_column :athletes, :bronze, :integer
  end
end
