# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'bcrypt'
require 'securerandom'

class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}
    before_validation :ensure_session_token

    has_many :cats,
        dependent: :destroy,
        class_name: :Cat,
        foreign_key: :user_id

    has_many :requests,
        dependent: :destroy,
        foreign_key: :requester_id,
        class_name: :CatRentalRequest

    def password
        @password
    end

    def password=(pw)
        @password = pw
        self.password_digest = BCrypt::Password.create(pw)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def is_password?(pw)
        password_object = BCrypt::Password.new(self.password_digest)
        password_object.is_password?(pw)
    end

    def self.find_by_credentials(username, pw)
        user = User.find_by(username: username)
        if user && user.is_password?(pw)
            return user
        else
            nil
        end
    end

    
end
