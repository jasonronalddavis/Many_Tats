class User < ApplicationRecord
  has_secure_password
  has_many :user_artists
  has_many :added_artists, through: :user_artists, source: :artist
  has_many :tats
  has_many :artists, through: :tats
  


 #validates :name, presence: { message: "must be given please" }
 validates_length_of :name, :within => 6..20, :too_long => "needs fewer than 20 character", :too_short => "needs at leat 6 characters"


  



  
end

#has_many :artists, foreign_key: "artist_id"
#class_name: "User", foreign_key



#