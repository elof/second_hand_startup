class ChangeTimeToTypeString < ActiveRecord::Migration
  def up
    change_column :events, :time, :string
  end

  def down
    change_column :events, :time, :time
  end
end
