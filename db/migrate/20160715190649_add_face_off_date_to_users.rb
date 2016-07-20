class AddFaceOffDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :faceoff_date, :timestamp
  end
end
