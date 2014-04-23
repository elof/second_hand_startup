class AddColumnMeridianEndToEvents < ActiveRecord::Migration
  def change
    add_column :events, :meridian_end, :string
  end
end
