class CreateSimUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :sim_units do |t|
      t.integer :unit_id
      t.string :status
      t.integer :hp
      t.integer :pos_x
      t.integer :pos_y
      t.boolean :has_shot
      t.boolean :has_moved
      t.integer :tactic_id
      t.integer :tactic_utility
      t.integer :sim_army_id

      t.timestamps
    end
  end
end
