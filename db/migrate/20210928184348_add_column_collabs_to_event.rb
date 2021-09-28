class AddColumnCollabsToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :collabs, :integer
  end
end
