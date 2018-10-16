class AddImagesToMulticast < ActiveRecord::Migration[5.0]
  def change
    add_column :multicasts, :cover_image, :string
    add_column :multicasts, :hero_image, :string
  end
end
