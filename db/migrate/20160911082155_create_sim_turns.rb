class CreateSimTurns < ActiveRecord::Migration[5.0]
  def change
    create_table :sim_turns do |t|
      t.integer :simulation_id
      t.integer :turn_count

      t.timestamps
    end
  end
end
