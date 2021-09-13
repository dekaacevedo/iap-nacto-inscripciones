class CreateAttendants < ActiveRecord::Migration[6.0]
  def change
    create_table :attendants do |t|
      t.string :first_name
      t.string :last_name
      t.string :rut
      t.string :phone
      t.string :email
      t.string :seat
      t.boolean :declaration
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
