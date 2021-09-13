class AddColumnEventToDeclaration < ActiveRecord::Migration[6.0]
  def change
    add_reference :declarations, :event, null: false, foreign_key: true
  end
end
