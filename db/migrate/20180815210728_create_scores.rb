class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :position
      t.string :points
      t.integer :poem_id

      t.timestamps

    end
  end
end
