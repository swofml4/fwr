class CreateJoinTableUnitAttributeUnitAttributeType < ActiveRecord::Migration[5.0]
  def change
    create_join_table :unit_attributes, :unit_attribute_types do |t|
      # t.index [:unit_attribute_id, :unit_attribute_type_id]
      # t.index [:unit_attribute_type_id, :unit_attribute_id]
    end
  end
end
