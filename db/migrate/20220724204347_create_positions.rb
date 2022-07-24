class CreatePositions < ActiveRecord::Migration[6.1]
  def change
    create_table :positions do |t|
      t.references :radar, index: true, foreign_key: true
      t.integer :x, null: false
      t.integer :y, null: false

      t.timestamps
    end
  end
end
