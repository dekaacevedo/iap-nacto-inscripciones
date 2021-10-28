class RemoveCollabSeatFromEventCollaborators < ActiveRecord::Migration[6.0]
  def change
    remove_reference :event_collaborators, :collab_seat, null: false, foreign_key: true
  end
end
