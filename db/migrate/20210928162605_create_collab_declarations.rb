class CreateCollabDeclarations < ActiveRecord::Migration[6.0]
  def change
    create_table :collab_declarations do |t|
      t.string :rut
      t.string :qa
      t.string :qb
      t.string :qc
      t.string :qd1
      t.string :qd2
      t.string :qd3
      t.string :qe1
      t.string :qe2
      t.string :qe3
      t.string :qe4
      t.string :qe5
      t.string :qe6
      t.string :qe7
      t.string :qe8
      t.references :event_collaborator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
