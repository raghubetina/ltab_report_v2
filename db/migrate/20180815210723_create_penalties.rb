class CreatePenalties < ActiveRecord::Migration
  def change
    create_table :penalties do |t|
      t.string :title
      t.float :points

      t.timestamps

    end
  end
end
