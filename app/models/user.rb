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

  # adds the following functionality:
    # - ability to save hashed password_digest attribute
    # - a pair of virtual attributes (password + password_confirmation)
    # - authenticate method that returns the user when correct
  has_secure_password
  # has_secure_password includes a presence validation but it applies only
  # to records with empty passwords which would allow a user to create an 
  # invalid password like "       "
  validates :password, presence: true, length: { minimum: 6 }
end
