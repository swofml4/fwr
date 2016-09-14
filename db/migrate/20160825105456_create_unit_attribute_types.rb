class CreateUnitAttributeTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_attribute_types do |t|
      t.string :name
      t.string :rule
      t.integer :adjustment
      t.integer :negated_by_unit_attribute_type_id
      t.timestamps
    end
  end
end
