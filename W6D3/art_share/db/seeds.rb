# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

user1 = User.new(username: 'pro_gamer_93')
user1.save!
user2 = User.new(username: 'lexicon')
user2.save!
user3 = User.new(username: 'lana_del_rey_fan_2003')
user3.save!
user4 = User.new(username: 'daydream_belieber')
user4.save!

# get 'artworks/:image_url', to: 'artworks#show', as: 'img'

Artwork.destroy_all

artwork1 = Artwork.new(title: 'Dancing in the Rain', image_url: 'dance', artist_id: user2.id)
artwork2 = Artwork.new(title: 'Lava Lamp in Still Life', image_url: 'lava', artist_id: user1.id)
artwork3 = Artwork.new(title: 'Sunset in Paris, 2015', image_url: 'paris', artist_id: user4.id)
artwork1.save!
artwork2.save!
artwork3.save!

ArtworkShare.destroy_all

ArtworkShare.new(viewer_id: user1.id, artwork_id: artwork1.id).save
ArtworkShare.new(viewer_id: user2.id, artwork_id: artwork1.id).save
ArtworkShare.new(viewer_id: user4.id, artwork_id: artwork1.id).save
ArtworkShare.new(viewer_id: user1.id, artwork_id: artwork3.id).save
ArtworkShare.new(viewer_id: user1.id, artwork_id: artwork3.id).save
ArtworkShare.new(viewer_id: user3.id, artwork_id: artwork2.id).save
