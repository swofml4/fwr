class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name
      t.integer :army_id
      t.integer :q
      t.integer :r
      t.integer :s
      t.timestamps
    end
  end
end
