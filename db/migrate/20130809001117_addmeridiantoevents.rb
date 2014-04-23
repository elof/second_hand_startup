class Addmeridiantoevents < ActiveRecord::Migration
  def change
    add_column :events, :meridian, :string
  end
end
