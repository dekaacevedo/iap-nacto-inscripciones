class RemoveDeclarationFromAttendants < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendants, :declaration, :boolean
  end
end
