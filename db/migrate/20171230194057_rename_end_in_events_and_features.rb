class RenameEndInEventsAndFeatures < ActiveRecord::Migration[5.0]
  def change
    rename_column :features, :end, :endtime
    rename_column :events, :end, :endtime
  end
end
