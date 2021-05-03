class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User

    belongs_to :post_sub,
        foreign_key: :sub_id,
        class_name: :PostSub
        
    has_many :posts,
        through: :post_sub,
        source: :posts

end
