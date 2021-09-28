class CreateCollabSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :collab_seats do |t|
      t.string :seat

      t.timestamps
    end
  end
end
