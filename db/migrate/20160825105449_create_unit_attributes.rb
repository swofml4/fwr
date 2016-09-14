class CreateUnitAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_attributes do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
