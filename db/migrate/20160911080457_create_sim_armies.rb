class CreateSimArmies < ActiveRecord::Migration[5.0]
  def change
    create_table :sim_armies do |t|
      t.integer :army_id
      t.integer :sim_turn_id
      t.integer :starting_unit_count
      t.string :status

      t.timestamps
    end
  end
end
