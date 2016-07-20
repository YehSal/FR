class CreateChars < ActiveRecord::Migration
  def change
    create_table :chars do |t|
      t.integer :score
      t.string :f_name
      t.string :l_name
      t.integer :age

      t.timestamps null: false
    end
  end
end
