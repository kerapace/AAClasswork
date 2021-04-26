# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cat1 = Cat.new(birth_date: '2013/04/28', color: 'orange', sex: 'M', name: 'Garfield', description: 'Likes lasagna, hates Mondays')
cat1.save!
cat2 = Cat.new(birth_date: '2017/09/18', color: 'black', sex: 'F', name: 'Artemis', description: 'Loves catnip, all business otherwise.')
cat2.save!