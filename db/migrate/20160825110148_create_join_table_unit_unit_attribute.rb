class CreateJoinTableUnitUnitAttribute < ActiveRecord::Migration[5.0]
  def change
    create_join_table :units, :unit_attributes do |t|
      # t.index [:unit_id, :unit_attribute_id]
      # t.index [:unit_attribute_id, :unit_id]
    end
  end
end
