class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :cat_id
      t.integer :offers_total
      t.string :category
      t.string :name
      t.string :price
      t.string :brand

      t.timestamps
    end
  end
end
