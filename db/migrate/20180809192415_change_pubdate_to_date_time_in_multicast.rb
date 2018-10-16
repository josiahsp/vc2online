class ChangePubdateToDateTimeInMulticast < ActiveRecord::Migration[5.0]
  def up
    change_column :multicasts, :pubdate, :datetime
  end
  
  def down
    change_column :multicasts, :pubdate, :date
  end
end
