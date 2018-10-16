class AddGooglemapsidToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :googlemapsid, :string
  end
end
