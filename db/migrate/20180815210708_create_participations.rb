class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :team_id
      t.integer :competition_id
      t.integer :finals
      t.integer :semifinals
      t.integer :quarterfinals

      t.timestamps

    end
  end
end
