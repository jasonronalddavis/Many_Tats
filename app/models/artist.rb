class Artist < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :users, through: :tats
  has_many :users
 # validates :artist_, uniqueness: true





end
