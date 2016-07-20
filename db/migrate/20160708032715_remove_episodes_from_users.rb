class RemoveEpisodesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :episodes, :integer
  end
end
