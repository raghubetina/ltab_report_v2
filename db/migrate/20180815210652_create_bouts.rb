class CreateBouts < ActiveRecord::Migration
  def change
    create_table :bouts do |t|
      t.integer :competition_id
      t.datetime :begins_at
      t.string :location
      t.string :title
      t.float :length

      t.timestamps

    end
  end
end
