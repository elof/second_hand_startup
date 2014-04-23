class AddEventIdToRsvps < ActiveRecord::Migration
  def change
    add_column :rsvps, :event_id, :integer
  end
end
