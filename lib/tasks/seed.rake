namespace :seed do
  desc 'getting categories'
  task categories: :environment do
    require Rails.root.join('lib', 'sem3_importer')
    puts "I'm importing categories"
    Sem3Importer.categories
  end

  desc 'getting products'
  task products: :environment do
    require Rails.root.join('lib', 'sem3_importer')
    puts "I'm importing products"
    Sem3Importer.products
  end
end
