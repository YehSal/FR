class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :total_score
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
