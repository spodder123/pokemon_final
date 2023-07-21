require 'json'
require 'open-uri'
require 'faker'

# Fetch data from the API
url = 'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json'
response = URI.open(url)
data = JSON.parse(response.read)

datap = data.first[1]

puts datap.first['type'].inspect

datap.each do |pokemon|
  category = Category.find_or_create_by(name: pokemon['type'].first)

  category.pokemons.build(
    name: pokemon['name'],
    price: Faker::Number.between(from: 200, to: 2000),
    height: pokemon['height'],
    weight: pokemon['weight'],
    candy: pokemon['candy'],
    categories_id: category.id
  )
  category.save

end








# # Seed the data
# data['networks'].each do |network|
#   country_name = network['location']['country']
#   city_bike_name = network['name']
#   company = network['company']&.first

#   # Find or create the country
#   country = Country.find_or_create_by(name: country_name)

#   # Create the city bike under the country
#   city_bike = country.city_bikes.create!(
#     name: city_bike_name,
#     company: company || 'Unknown', # Set a default value if company is missing
#     city: network['location']['city']
#   )

#   # Create random prices for the city bike in all countries
#   Country.all.each do |country|
#     price = Faker::Number.between(from: 200, to: 2000)
#     city_bike.prices.create!(price: price, country: country)
#   end
# end
