class AddColumnSeatToEventCollaborators < ActiveRecord::Migration[6.0]
  def change
    add_column :event_collaborators, :seat, :string
  end
end
