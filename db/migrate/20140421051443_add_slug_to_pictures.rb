class AddSlugToPictures < ActiveRecord::Migration
  def change
  	add_column :pictures, :slug, :string
  	add_index :pictures, :slug
  end
end
