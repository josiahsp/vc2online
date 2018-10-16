class CreateKioskitems < ActiveRecord::Migration[5.0]
  def change
    create_table :kioskitems do |t|
      t.string :title
      t.string :path
      t.string :cover_image
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :active

      t.timestamps
    end
  end
end
