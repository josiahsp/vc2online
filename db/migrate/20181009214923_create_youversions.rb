class CreateYouversions < ActiveRecord::Migration[5.0]
  def change
    create_table :youversions do |t|
      t.string :series
      t.string :title
      t.datetime :start
      t.integer :eventnumber

      t.timestamps
    end
  end
end
