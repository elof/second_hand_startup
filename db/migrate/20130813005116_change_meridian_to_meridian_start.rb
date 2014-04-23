class ChangeMeridianToMeridianStart < ActiveRecord::Migration
  def change
    rename_column :events, :meridian, :meridian_start
  end
end
