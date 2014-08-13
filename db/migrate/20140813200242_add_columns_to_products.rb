class AddColumnsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :string
    add_column :products, :upc, :string
  end
end
