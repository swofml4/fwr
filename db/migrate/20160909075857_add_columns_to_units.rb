class AddColumnsToUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :hp, :integer
    add_column :units, :cost, :integer
    add_column :units, :sim_cost, :decimal
    add_column :units, :sim_shift, :integer
  end
end
