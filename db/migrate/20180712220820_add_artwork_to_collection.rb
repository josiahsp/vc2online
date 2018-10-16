class AddArtworkToCollection < ActiveRecord::Migration[5.0]
  def change
      add_column :collections, :artwork, :string
      add_column :collections, :hero_image, :string
  end
end
