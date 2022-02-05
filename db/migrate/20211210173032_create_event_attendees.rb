class CreateEventAttendees < ActiveRecord::Migration[6.0]
  def change
    create_table :event_attendees do |t|
      t.references :event, null: false, foreign_key: true
      t.references :attendee, null: false, foreign_key: true
      t.string :seat
      t.string :temperature

      t.timestamps
    end
  end
end
