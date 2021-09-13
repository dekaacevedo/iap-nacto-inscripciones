class CreateDeclarations < ActiveRecord::Migration[6.0]
  def change
    create_table :declarations do |t|
      t.string :rut
      t.boolean :qa
      t.boolean :qb
      t.boolean :qc
      t.boolean :qd1
      t.boolean :qd2
      t.boolean :qd3
      t.boolean :qe1
      t.boolean :qe2
      t.boolean :qe3
      t.boolean :qe4
      t.boolean :qe5
      t.boolean :qe6
      t.boolean :qe7
      t.boolean :qe8
      t.references :attendant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
