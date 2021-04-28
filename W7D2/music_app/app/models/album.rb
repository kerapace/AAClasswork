class Album < ApplicationRecord
    RECORDING_TYPES = %w(live studio archival compilation)

    validates :recording_type, inclusion: {in: RECORDING_TYPES, message: "invalid release type"}
    validates :title, :year, :band_id, presence: true

    belongs_to :band,
        class_name: :Band,
        foreign_key: :band_id
end
