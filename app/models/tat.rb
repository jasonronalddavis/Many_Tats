class Tat < ApplicationRecord
    belongs_to :artist , optional: true
    belongs_to :user, optional: true

    
end
