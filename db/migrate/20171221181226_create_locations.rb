class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :title
      t.string :building
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :leader

      t.timestamps
    end
  end
end
