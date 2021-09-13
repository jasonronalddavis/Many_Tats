class Tat < ApplicationRecord
    belongs_to :artist , optional: true
    belongs_to :user
    
  validates :description, :style, :appointment_date, :color_range, :name,  presence: { message: "is empty" }
  validates :name, length: { minimum: 2, :too_short => "needs at leat 3 characters" }
 
end


