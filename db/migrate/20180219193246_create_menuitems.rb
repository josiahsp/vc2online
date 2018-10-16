class CreateMenuitems < ActiveRecord::Migration[5.0]
  def change
    create_table :menuitems do |t|
      t.string :title
      t.string :path
      t.references :submenu

      t.timestamps
    end
  end
end
