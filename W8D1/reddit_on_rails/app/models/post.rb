class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :post_sub,
        foreign_key: :post_id,
        class_name: :PostSub

    has_many :subs,
        through: :post_sub,
        source: :subs

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

end
