class Specialty < ApplicationRecord
    has_many :trainer_specialties
    has_many :trainers, through: :trainer_specialties
end
