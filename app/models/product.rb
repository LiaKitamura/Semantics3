class Product
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :cat_id, type: Integer
  field :offers_total, type: Integer
  field :category, type: String
  field :name, type: String
  field :price, type: String
  field :brand, type: String
  field :weight, type: String
  field :upc, type: String
end
