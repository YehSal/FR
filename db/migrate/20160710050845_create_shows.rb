class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.integer :episodes
      t.float :popularity
      t.float :vote_average
      t.integer :vote_count

      t.timestamps null: false
    end
  end
end
