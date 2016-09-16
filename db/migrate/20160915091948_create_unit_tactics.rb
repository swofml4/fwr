class CreateUnitTactics < ActiveRecord::Migration[5.0]
  def change
    create_table :unit_tactics do |t|
      t.integer :unit_id
      t.integer :tactic_id
      t.integer :base_bias

      t.timestamps
    end
  end
end
