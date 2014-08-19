class ProductsController < ApplicationController

  def index
    # @products = Product.all.plluck(:cat_id, :offers_total, :category, :name, :price, :brand, :weight, :upc)
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @products }
    end
  end

end
