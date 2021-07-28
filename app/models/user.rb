class User < ApplicationRecord
  has_secure_password
  has_many :artists
  has_many :added_artists, through: :user_artists, source: :artist
  has_many :tats
  has_many :artists, through: :tats
  
  validates :name, presence: { message: "must be given please" }
  validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }


end

#has_many :artists, foreign_key: "artist_id"
#class_name: "User", foreign_key