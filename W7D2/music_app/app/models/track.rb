class Track < ApplicationRecord
    validates :title, :ord, :album_id, :length, presence: true
    validate :valid_length

    def valid_length
        return false if self.length !~ %r{^(\d+:)*\d+$}
    end
end
