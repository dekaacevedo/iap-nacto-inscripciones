class AddColumnTemperatureToEventCollaborators < ActiveRecord::Migration[6.0]
  def change
    add_column :event_collaborators, :temperature, :string
  end
end
