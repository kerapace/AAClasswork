class ArtworkShare < ApplicationRecord
    validate :artwork_id, :viewer_id, presence: true
    validates :artwork_id, :viewer_id, uniqueness: true

    belongs_to :artwork,
        foreign_key: :artwork_id,
        class_name: :Artwork
    
    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User
end