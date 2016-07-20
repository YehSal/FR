class AddImageToChars < ActiveRecord::Migration
  def change
    add_column :chars, :image, :string
  end
end
