require 'securerandom'

class User < ApplicationRecord

    attr_reader :password

    validates :email, :password_digest, :session_token, presence: true
    validates :password, length: {minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token

    def self.find_by_credentials(email,password)
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            user
        else
            nil
        end
    end

    def password=(pw)
        @password= pw
        self.password_digest = BCrypt::Password.create(pw)
    end

    def is_password?(pw)
        pw_object = BCrypt::Password.new(self.password_digest)
        pw_object.is_password?(pw)
    end

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end
end