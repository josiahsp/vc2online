class AddActiveToPrayers < ActiveRecord::Migration[5.0]
  def change
    add_column :prayers, :active, :boolean
  end
end
