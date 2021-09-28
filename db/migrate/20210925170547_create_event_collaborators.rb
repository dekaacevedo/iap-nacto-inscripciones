class CreateEventCollaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :event_collaborators do |t|
      t.references :collab_seat, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :collaborator, null: false, foreign_key: true

      t.timestamps
    end
  end
end
