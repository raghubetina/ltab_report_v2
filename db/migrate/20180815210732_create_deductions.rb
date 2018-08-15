class CreateDeductions < ActiveRecord::Migration
  def change
    create_table :deductions do |t|
      t.integer :poem_id
      t.integer :penalty_id

      t.timestamps

    end
  end
end
