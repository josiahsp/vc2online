class AddImagesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :hero_image, :string
    add_column :events, :hero_square_image, :string
    add_column :events, :cover_image, :string
    add_column :events, :thumbnail_image, :string
  end
end
