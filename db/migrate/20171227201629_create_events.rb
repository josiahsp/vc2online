class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :subtitle
      t.text :synopsis
      t.text :content
      t.references :location
      t.string :location_building
      t.string :location_address
      t.string :location_address2
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :location_googlemapsid
      t.datetime :start
      t.datetime :end
      t.references :videos
      t.references :images
      t.references :links
      t.float :price

      t.timestamps
    end
  end
end
