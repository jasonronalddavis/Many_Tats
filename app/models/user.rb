class User < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :artists, through: :tats


end