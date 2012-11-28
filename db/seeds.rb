# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create(
    title: 'Apple Macbook 13"',
    description: %{<p>Great Aluminum macbook, used but not fugly</p>},
    image_url: 'http://lorempixel.com/80/60/technics/3/',
    price: 8900
)
Product.create(
    title: 'Apple iPad 3rd gen',
    description: %{<p>Amazing screen, you'll shit bricks!</p>},
    image_url: 'http://lorempixel.com/80/60/technics/1/',
    price: 6400
)
Product.create(
    title: 'Apple iPhone 4S',
    description: %{<p>Speedy iPhone from last version</p>},
    image_url: 'http://lorempixel.com/80/60/technics/7/',
    price: 2300
)
Product.create(
    title: 'Sony MDR-V150',
    description: %{<p>Dynamic Stereo Headphones of high quality that delivers to any DJ.</p>},
    image_url: 'http://lorempixel.com/80/60/technics/6/',
    price: 580
)
Product.create(
    title: 'Samsung LED TV 48"',
    description: %{<p>Unusually sized awesome LED TV, latest shit!</p>},
    image_url: 'http://lorempixel.com/80/60/technics/9/',
    price: 12300
)