class Artist < ApplicationRecord
  has_secure_password
  has_many :tats
  has_many :users, through: :tats
  has_many :users
  has_many :artists

  validates :password, presence: { message: "must be given please" }, length: { in: 6..20 }

end
