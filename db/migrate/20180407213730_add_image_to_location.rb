class AddImageToLocation < ActiveRecord::Migration[5.0]
  def change  
    add_column :locations, :hero_image, :string
    add_column :locations, :hero_square_image, :string
    add_column :locations, :cover_image, :string
    add_column :locations, :thumbnail_image, :string
  end
end
