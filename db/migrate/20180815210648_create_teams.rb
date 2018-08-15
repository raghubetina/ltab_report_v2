class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :organization_name
      t.string :location

      t.timestamps

    end
  end
end
