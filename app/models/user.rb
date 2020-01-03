class User < ApplicationRecord
    has_many :bookings, dependent: :destroy
    has_many :trainers, through: :bookings
    belongs_to :area
    has_secure_password

    validates :username, { presence: true, uniqueness: true, length: {maximum: 20}}
    validates :password, { presence: true, length: {minimum: 8, maximum: 20}}
    validates :name, { presence: true, length: {maximum: 40}}
    validates :age, { presence: true, numericality: {greater_than: 0, less_than: 122}}
    validates :gender, { presence: true}
    validates :email, { presence: true, length:{maximum: 50}, }
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :area, { presence: true}

    GENDERS = ["Male", "Female", "Other", "Prefer not to specify"]

    def trainers_in_my_area
        self.area.trainers.map{|trainer| trainer} 
    end
    
end
