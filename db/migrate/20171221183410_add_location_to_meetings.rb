class AddLocationToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_reference :meetings, :location, foreign_key: true
  end
end
