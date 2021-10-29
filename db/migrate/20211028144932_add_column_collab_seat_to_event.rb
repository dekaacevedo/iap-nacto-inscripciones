class AddColumnCollabSeatToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :collab_seat, :string, array: true
  end
end
