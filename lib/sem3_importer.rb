require 'rubygems'
require 'semantics3'
require 'mongo'

class Sem3Importer

  def self.products
    sem3 = Semantics

    categories = ['tents', 'knives and tools', 'downhill skiing']

    categories.each do |category|
      sem3.products_field( "name", "#{category}" )
    end


    constructedJson = sem3.get_query_json( "products" )
    productsHash = sem3.get_products
    all = productsHash["results"]

    all.each do |product|
      Product.find_or_create_by({cat_id: product["cat_id"], offers_total: product["offers_total"], category: product["category"], name: product["name"], price: product["price"], brand: product["brand"], weight: product["weight"], upc: product["upc"]})
    end
  end

end
