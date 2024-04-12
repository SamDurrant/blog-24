class User < ApplicationRecord
  # callback gets called before saving user to db
  # before_save { self.email = email.downcase }
  # same as above
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, 
                    format: { with: VALID_EMAIL_REGEX },
                    # does not guarantee uniqueness at db level
                    uniqueness: true
end
