class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.references :radar, index: true, foreign_key: true
      t.string :target_type, null: false
      t.integer :damage

      t.timestamps
    end
  end
end
