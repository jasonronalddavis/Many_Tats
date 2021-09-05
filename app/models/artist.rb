class Artist < ApplicationRecord
  has_secure_password
  has_many :user_artists
  has_many :users, through: :user_artists
  has_many :tats
  
  validates :name, presence:  { message: "must be given please" }
  validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }

  validates :name, uniqueness: {message: "has already been taken"}



  def to_hash
  @artist.attributes.reject! {|key, value| key == "password_digest" || key == "bio" || key == "artist_id"}
end





end



#has_many :added_users, through: :user_artists, source: :user