class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.integer :poet_id
      t.integer :bout_id

      t.timestamps

    end
  end
end
