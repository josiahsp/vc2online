class AddSlugToEventsPagesAndLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :slug, :string
    add_column :locations, :slug, :string
    add_column :pages, :slug, :string
  end
end
