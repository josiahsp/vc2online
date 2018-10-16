class ChangeMeetingTitleToReference < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :title, :string
    add_column :meetings, :title, :integer, references: :service
  end
end
