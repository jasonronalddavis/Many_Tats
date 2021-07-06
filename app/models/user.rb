class User < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :artists, through: :tats
  has_many :artists


  validates :password, presence:  { message: "must be given please" }, length: { in: 6..20 }
  validates_associated :name, length: { minimum: 2 }, presence:  { message: 'Cannot locate User' }, uniqueness: { message: 'Name already taken' }
  

end