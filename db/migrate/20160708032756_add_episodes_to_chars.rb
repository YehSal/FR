class AddEpisodesToChars < ActiveRecord::Migration
  def change
    add_column :chars, :episodes, :integer
  end
end
