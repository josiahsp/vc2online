class AddArchivedToContact < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :archived, :boolean
    add_column :contacts, :archiver, :integer
  end
end
