class AddColumnFichaToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :ficha, :boolean, default: false
  end
end
