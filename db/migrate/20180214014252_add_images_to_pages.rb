class AddImagesToPages < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :hero_image, :string
    add_column :pages, :hero_square_image, :string
    add_column :pages, :cover_image, :string
    add_column :pages, :thumbnail_image, :string
  end
end
