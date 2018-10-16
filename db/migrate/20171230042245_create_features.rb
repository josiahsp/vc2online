class CreateFeatures < ActiveRecord::Migration[5.0]
  def change
    create_table :features do |t|
      t.datetime :expiration
      t.integer :level
      t.references :event, foreign_key: true
      t.references :page, foreign_key: true
      t.integer :classification

      t.timestamps
    end
  end
end
