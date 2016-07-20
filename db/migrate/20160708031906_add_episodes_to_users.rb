class AddEpisodesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :episodes, :integer
  end
end
