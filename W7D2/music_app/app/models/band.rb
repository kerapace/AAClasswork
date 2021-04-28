class Band < ApplicationRecord
    validates :band_name, presence: true

    has_many :albums,
        class_name: :Album,
        foreign_key: :band_id
end
