class ChangeDateToTypeString < ActiveRecord::Migration
  def up
    change_column :events, :date, :string
  end

  def down
    change_column :events, :date, :date
  end
end
