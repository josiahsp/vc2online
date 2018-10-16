class CreatePrayers < ActiveRecord::Migration[5.0]
  def change
    create_table :prayers do |t|
      t.string :title
      t.text :details
      t.text :scripture_1
      t.text :scripture_2
      t.text :scripture_3

      t.timestamps
    end
  end
end
