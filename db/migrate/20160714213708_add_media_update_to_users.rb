class AddMediaUpdateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :media_update, :datetime
  end
end
