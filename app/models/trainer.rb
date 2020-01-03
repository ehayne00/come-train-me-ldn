class Trainer < ApplicationRecord
    has_many :bookings, dependent: :destroy
    has_many :users, through: :bookings
    has_many :trainer_specialties, dependent: :destroy 
    has_many :specialties, through: :trainer_specialties
    belongs_to :area
    has_secure_password
    has_one_attached :image
    accepts_nested_attributes_for :specialties

    validates :price, { presence: true}
    validates :username, { presence: true, uniqueness: true, length: {maximum: 20}}
    validates :password, {presence: true, length: {minimum: 8, maximum: 20}}
    validates :name, {presence: true, length: {maximum: 40}}
    validates :email, { presence: true, length:{maximum: 50}, }
    validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
    validates :gender, {presence: true}

    GENDERS = ["Male", "Female", "Other", "Prefer not to specify"]

    def trainer_specialties
        self.specialties.map{|spec| spec.name}.join(", ")
    end

    def trainer_bookings
        self.bookings.map{|bookings| "You are booked with #{booking.user.name} on #{booking.date}, at #{booking.time}. Their email address is: #{booking.user.email}."}
        #this gives an array of strings. iterate through in my_bookings page as list.
    end
end
