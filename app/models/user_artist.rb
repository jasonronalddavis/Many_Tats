class UserArtist < ApplicationRecord
    belongs_to :user
    belongs_to :artist

  end
  
  
  #class_name: "User", foreign_key 

  # rails generate migration RemoveUserIdFromArtistId user_id:integer