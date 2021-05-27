# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

puts "Importing categories..."
CSV.foreach(Rails.root.join("db/seeds/categories.csv"), headers: true) do |row|
  Category.create! do |category|
    category.id = row[0]
    category.name = row[1]
  end
end

puts "Importing states..."
CSV.foreach(Rails.root.join("db/seeds/states.csv"), headers: true) do |row|
  State.create! do |state|
    state.id = row[0]
    state.name = row[1]
  end
end

puts "Importing municipalities..."
CSV.foreach(Rails.root.join("db/seeds/municipalities.csv"), headers: true) do |row|
  Municipality.create! do |municipality|
    municipality.state_id = row[0]
    municipality.name = row[1]
  end
end

puts "Importing postals..."
CSV.foreach(Rails.root.join("db/seeds/postals.csv"), headers: true) do |row|
  Postal.create! do |postal|
    postal.municipality_id = row[0]
    postal.name = row[1]
  end
end

puts "Importing settlements..."
CSV.foreach(Rails.root.join("db/seeds/settlements.csv"), headers: true) do |row|
  Settlement.create! do |settlement|
    settlement.postal_id = row[0]
    settlement.name = row[1]
  end
end
