class Tat < ApplicationRecord
    belongs_to :artist , optional: true
    belongs_to :user, optional: true

    validates  :description, :style, :appointment_date, :color_range, length: { minimum: 2 }, presence: { message: "must be given please" }

    #validates :name, :login, :email, absence: true
end
