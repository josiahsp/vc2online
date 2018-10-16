class AddMainmenuToMenuitems < ActiveRecord::Migration[5.0]
  def change
    add_column :menuitems, :mainmenu, :boolean
  end
end
