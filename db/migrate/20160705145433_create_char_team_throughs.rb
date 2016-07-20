class CreateCharTeamThroughs < ActiveRecord::Migration
  def change
    create_table :char_team_throughs do |t|
      t.integer :char_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
