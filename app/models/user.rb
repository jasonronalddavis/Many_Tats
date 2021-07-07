class User < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :artists, through: :tats
  has_many :artists


  validates :password, presence:  { message: "must be given please" }
  validates :name, presence:  { message: "must be given please" }
  validates :name, length: { minimum: 6, :too_short => "needs at leat 3 characters" }
  validates :name, uniqueness: {message: "has already been taken"}
  

end