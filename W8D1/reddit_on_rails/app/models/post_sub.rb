class PostSub < ApplicationRecord
    has_many :subs,
        foreign_key: :sub_id,
        class_name: :Sub

    has_many :posts,
        foreign_key: :post_id,
        class_name: :Post

    
end
