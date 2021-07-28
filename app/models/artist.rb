class Artist < ApplicationRecord
  has_secure_password
  has_many :users, foreign_key: "user_id"
  has_many :users, through: :user_artists, source: :user
  has_many :tats



  validates :name, presence:  { message: "must be given please" }
  validates :name, length: { minimum: 3, :too_short => "needs at leat 3 characters" }

  validates :password, presence:  { message: "must be given please" }

  validates :name, uniqueness: {message: "has already been taken"}
end
