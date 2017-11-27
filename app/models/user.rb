class User < ApplicationRecord
    before_save {email.downcase! }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :name, presence: true
    validates :email, uniqueness: { case_sensitive: false},
        presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 6 }

    has_secure_password
end
