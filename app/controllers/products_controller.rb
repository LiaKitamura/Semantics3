class ProductsController < ApplicationController

  def index
    # @products = Product.all.pluck(:cat_id, :offers_total, :category, :name, :price, :brand, :weight, :upc)
    @products = Product.all
  end

end
