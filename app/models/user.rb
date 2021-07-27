class User < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :artists, through: :tats
  has_many :artists, through: :user_artists
  

  
  validates :name, presence: { message: "must be given please" }
  validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }


end


#class_name: "User", foreign_key