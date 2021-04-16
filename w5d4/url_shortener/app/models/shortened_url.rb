class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true

    belongs_to :submitter,
        class_name: :User,
        primary_key: :id,
        foreign_key: :user_id

    has_many :visits,
        class_name: :Visit,
        primary_key: :short_url,
        foreign_key: :shortened_url

    has_many :visitors,
        Proc.new { distinct },
        through: :visits,
        source: :visitor

    # belongs to user_id
    def self.random_code
        url_hash = nil
        while !url_hash || ShortenedUrl.exists?(:short_url => url_hash)
            url_hash = SecureRandom::urlsafe_base64
        end
        url_hash
    end

    def self.create!(user, long_url)
        short_url = "http://example.com/" + ShortenedUrl.random_code[0...5]
        ShortenedUrl.create({:user_id => user.id, :long_url => long_url, :short_url => short_url})
    end

    def num_clicks
        visits.length
    end

    def num_uniques
        Visit.select(:user_id)
             .distinct
             .where(shortened_url: short_url)
             .count
        # Location.select(:name, :website, :city).find(row.id)
    end

    def num_recent_uniques
        Visit.select(:user_id)
        .distinct
        .where(
            shortened_url: short_url,
            created_at: 10.minutes.ago..Time.now)
        .count
    end

end