class AddPosterToShow < ActiveRecord::Migration
  def change
    add_column :shows, :poser, :string
  end
end
