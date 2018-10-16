class AddActivateAndLiveToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :activate, :datetime
    add_column :features, :live, :boolean
  end
end
