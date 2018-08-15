class CreatePoems < ActiveRecord::Migration
  def change
    create_table :poems do |t|
      t.integer :round_id
      t.integer :poet_id
      t.integer :minutes
      t.string :seconds
      t.text :notes

      t.timestamps

    end
  end
end
