class ChangeUnitColumnNames < ActiveRecord::Migration[5.0]
  def change
  	rename_column :units, :q, :quality
  	rename_column :units, :r, :resilience
  	rename_column :units, :s, :strength
  end
end
