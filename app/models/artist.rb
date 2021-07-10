class Artist < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :users, through: :tats
  has_many :users
  has_many :artists
<<<<<<< HEAD
  validates :name, presence:  { message: "must be given please" }
  validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }
=======
<<<<<<< HEAD
  validates :name, presence:  { message: "must be given please" }
  validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }
=======
  validates :password, presence:  { message: "must be given please" }
  validates :name, presence:  { message: "must be given please" }
  validates :name, length: { minimum: 6, :too_short => "needs at leat 3 characters" }
>>>>>>> 6cf5cb1265fb6ec6378ebc3978a3e2cee8b77872
>>>>>>> 7a071280fbafac545f95b3bf654b412ae461154f
  validates :name, uniqueness: {message: "has already been taken"}
end
