class Artwork < ApplicationRecord
    validates :artist_id, :title, uniqueness: true
    validates :artist_id, :title, :image_url, presence: true

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
    
    has_many :shared_users,
        through: :artwork_shares,
        source: :viewer
end