class ChangeCostToTypeString < ActiveRecord::Migration
  def up
    change_column :events, :cost, :string 
  end

  def down
    change_column :events, :cost, :float
  end
end
