class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :participation_id
      t.integer :bout_id
      t.boolean :assigned

      t.timestamps

    end
  end
end
