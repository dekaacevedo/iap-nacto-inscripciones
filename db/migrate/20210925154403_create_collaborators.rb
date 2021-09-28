class CreateCollaborators < ActiveRecord::Migration[6.0]
  def change
    create_table :collaborators do |t|
      t.string :first_name
      t.string :last_name
      t.string :rut
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
