class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :participation_id
      t.integer :poet_id

      t.timestamps

    end
  end
end
