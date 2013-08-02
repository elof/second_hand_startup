class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.string :type
      t.text :description
      t.float :cost
      t.string :location
      t.string :coordinates
      t.integer :min_attendee_number
      t.integer :max_attendee_number
      t.string :image_url
      t.timestamps
    end
  end
end
