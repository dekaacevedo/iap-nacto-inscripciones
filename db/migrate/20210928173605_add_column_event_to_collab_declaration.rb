class AddColumnEventToCollabDeclaration < ActiveRecord::Migration[6.0]
  def change
    add_reference :collab_declarations, :event, null: false, foreign_key: true
  end
end
