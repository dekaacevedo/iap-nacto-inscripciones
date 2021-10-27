class AddColumnTemperatureToAttendants < ActiveRecord::Migration[6.0]
  def change
    add_column :attendants, :temperature, :string
  end
end
