class RenameExpirationToEndInFeatures < ActiveRecord::Migration[5.0]
  def change
    rename_column :features, :expiration, :end
    rename_column :features, :activate, :start
  end
end
