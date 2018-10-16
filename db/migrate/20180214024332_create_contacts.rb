class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :phone
      t.boolean :attendance
      t.boolean :growgroup
      t.string :growgroupleader
      t.boolean :dreamteam
      t.string :dreamteamleader
      t.text :details

      t.timestamps
    end
  end
end
