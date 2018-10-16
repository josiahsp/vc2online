class AddCoverImageToQuickItem < ActiveRecord::Migration[5.0]
  def change
    add_column :quickitems, :cover_image, :string
  end
end
