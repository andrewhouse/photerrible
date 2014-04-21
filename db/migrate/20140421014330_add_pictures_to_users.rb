class AddPicturesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :picture_id, :integer
  	add_index :users, :picture_id
  end
end
