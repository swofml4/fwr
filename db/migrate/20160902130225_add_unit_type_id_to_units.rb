class AddUnitTypeIdToUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :unit_type_id, :integer
  end
end
