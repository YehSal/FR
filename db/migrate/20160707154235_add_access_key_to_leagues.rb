class AddAccessKeyToLeagues < ActiveRecord::Migration
  def change
    add_column :leagues, :access_key, :string
  end
end
