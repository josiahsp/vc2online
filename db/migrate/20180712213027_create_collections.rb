class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :title
      t.date :startdate
      t.date :enddate
      t.text :description
      t.string :keywords

      t.timestamps
    end
  end
end
