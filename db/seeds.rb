# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTParty.get('https://ron-swanson-quotes.herokuapp.com/v2/quotes/100')
quotes = response.parsed_response
count = 0
quotes.each do |quote|
  next if Quote.find_by(text: quote)
  word_count = quote.split.length
  Quote.create(text: quote, length: word_count)
  count += 1
end
puts "#{count} quotes created."
