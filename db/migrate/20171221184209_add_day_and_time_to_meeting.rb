class AddDayAndTimeToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :weekday, :integer
    add_column :meetings, :time, :time
  end
end
