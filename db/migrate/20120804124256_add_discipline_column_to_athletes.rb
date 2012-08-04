class AddDisciplineColumnToAthletes < ActiveRecord::Migration
  def change
    add_column :athletes, :discipline, :string
  end
end
