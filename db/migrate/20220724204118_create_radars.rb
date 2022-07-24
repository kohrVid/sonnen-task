class CreateRadars < ActiveRecord::Migration[6.1]
  def change
    create_table :radars do |t|

      t.timestamps
    end
  end
end
