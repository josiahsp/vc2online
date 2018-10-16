class CreateSubmenus < ActiveRecord::Migration[5.0]
  def change
    create_table :submenus do |t|
      t.string :title
      t.boolean :mainmenu

      t.timestamps
    end
  end
end
