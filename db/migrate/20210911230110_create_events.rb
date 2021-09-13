class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.integer :quantity
      t.string :seats, array: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :events, :seats, using: 'gin'
  end
end
