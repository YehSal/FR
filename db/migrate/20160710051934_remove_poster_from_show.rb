class RemovePosterFromShow < ActiveRecord::Migration
  def change
    remove_column :shows, :poser, :string
  end
end
