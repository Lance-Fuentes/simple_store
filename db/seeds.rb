# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "csv"

Product.destroy_all
Category.destroy_all

=begin This is manual using Faker data instead of csv
676.times do
   Product.create(
      title: Faker::Commerce.unique.product_name,
      price: Faker::Commerce.price,
      stock_quantity: Faker::Number.number(digits: 3)
    )
end
=end

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true, encoding: 'iso-8859-1')

products.each do |product|

  # Get the category name from the CSV data
  category_name = product['category']

  # Find or create the category
  category = Category.find_or_create_by(name: category_name)

  # Create the product
  Product.create(
    title: product['name'],
    price: product['price'],
    description: product['description'],
    stock_quantity: product['stock quantity'],
    category_id: category.id
  )

end



puts "Created #{Category.count} categories"
puts "Created #{Product.count} products"
