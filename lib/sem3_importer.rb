require 'rubygems'
require 'semantics3'

class Sem3Importer
  @api_key='API_KEY_HERE'
  @api_secret='API_SECRET_HERE'

  # Trying to save just top level category names here. Now that I think about it I don't think this is necessary.

  # def self.categories
  #   sem3 = Semantics3::Products.new(@api_key,@api_secret)
  #   sem3.categories_field("name", "Sporting Equipment")
  #
  #   constructedJson = sem3.get_query_json( "categories" )
  #   categoriesHash = sem3.get_categories
  #   category = categoriesHash
  #   cat_results = category["results"]
  #   final = cat_results.first
  #
  #   Category.find_or_create_by(main_category_name: final["name"], main_category_id: final["cat_id"])
  #
  # end


  # This is not the ideal way to get the data from the DB. But works for now while I work on cleaning this up

  def self.products
    sem3 = Semantics3::Products.new(@api_key,@api_secret)

    sem3.products_field( "name", "tents" )
    sem3.products_field( "name", "knives and tools" )
    sem3.products_field( "name", "downhill skiing" )
    # sem3.products_field( "name", "goggles" )
    
    constructedJson = sem3.get_query_json( "products" )
    productsHash = sem3.get_products
    all = productsHash["results"]

    all.each do |product|
      Product.find_or_create_by(cat_id: product["cat_id"], offers_total: product["offers_total"], category: product["category"], name: product["name"], price: product["price"], brand: product["brand"], weight: product["weight"], upc: product["upc"])
    end
  end

end
