class AddCaptionToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :caption, :text
  end
end
