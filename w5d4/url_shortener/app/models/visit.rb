class Visit < ApplicationRecord
  validates :shortened_url, :user_id, presence: true

  belongs_to :visitor,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :visited_url,
    class_name: :ShortenedUrl,
    primary_key: :short_url,
    foreign_key: :shortened_url

  def self.record_visit!(user, shortened_url)
    Visit.create(shortened_url: shortened_url, user_id: user.id)
  end
end
