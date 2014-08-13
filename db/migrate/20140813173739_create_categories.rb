class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :main_category_name
      t.string :main_category_id
      t.timestamps
    end
  end
end
