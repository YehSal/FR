class AddShowToChar < ActiveRecord::Migration
  def change
    add_column :chars, :show, :string
  end
end
