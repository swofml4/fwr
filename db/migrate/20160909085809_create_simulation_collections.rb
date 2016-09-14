class CreateSimulationCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :simulation_collections do |t|
      t.string :status
      t.integer :sim_count
      t.integer :army_points

      t.timestamps
    end
  end
end
