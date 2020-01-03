class Booking < ApplicationRecord
    belongs_to :user
    belongs_to :trainer

    validates :date, {presence: true}
    validates :time, {presence: true}
    validates :trainer_id, {presence: true}

    TIMES = ["08:00", "09:00", "10:00", "11:00", "12:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00"]

    
end
