class CreatePoets < ActiveRecord::Migration
  def change
    create_table :poets do |t|
      t.integer :team_id
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email

      t.timestamps

    end
  end
end
