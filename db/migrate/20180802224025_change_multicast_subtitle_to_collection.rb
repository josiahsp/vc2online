class ChangeMulticastSubtitleToCollection < ActiveRecord::Migration[5.0]
  def change
  
      remove_column :multicasts, :subtitle
      add_reference :multicasts, :collection, foreign_key: true
    
  end
end
