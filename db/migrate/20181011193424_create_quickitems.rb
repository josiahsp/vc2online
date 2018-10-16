class CreateQuickitems < ActiveRecord::Migration[5.0]
  def change
    create_table :quickitems do |t|
      t.string :title
      t.string :path
      t.integer :order

      t.timestamps
    end
  end
end
