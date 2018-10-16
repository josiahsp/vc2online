class CreateMulticasts < ActiveRecord::Migration[5.0]
  def change
    create_table :multicasts do |t|
      t.string :title
      t.string :author
      t.string :subtitle
      t.text :summary
      t.string :guid
      t.date :pubdate
      t.integer :duration
      t.string :keywords

      t.timestamps
    end
  end
end
