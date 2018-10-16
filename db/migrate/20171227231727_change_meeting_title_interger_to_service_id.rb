class ChangeMeetingTitleIntergerToServiceId < ActiveRecord::Migration[5.0]
  def change
    rename_column :meetings, :title, :service_id
  end
end
