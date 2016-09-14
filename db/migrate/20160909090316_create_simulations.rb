class CreateSimulations < ActiveRecord::Migration[5.0]
  def change
    create_table :simulations do |t|
      t.integer :simulation_collection_id
      t.integer :sim_number

      t.timestamps
    end
  end
end
