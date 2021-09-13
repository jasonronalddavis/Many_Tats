class Artist < ApplicationRecord
  has_secure_password
  has_many :user_artists
  has_many :users, through: :user_artists
  has_many :tats


  validates_length_of :name, :within => 6..20, :too_long => "needs fewer than 20 character", :too_short => "needs at leat 6 characters"
  validates :name, presence:  { message: "must be given please" }
 #validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }

  validates :name, uniqueness: {message: "has already been taken"}







end



#has_many :added_users, through: :user_artists, source: :user