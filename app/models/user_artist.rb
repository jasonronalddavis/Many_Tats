class UserArtist < ApplicationRecord
  belongs_to :artist
  belongs_to :user


  validates :added_artists, absence: true
  
  end
  
  
  #class_name: "User", foreign_key 

  # rails generate migration RemoveUserIdFromArtistId user_id:integer