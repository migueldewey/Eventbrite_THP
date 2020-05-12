class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	#belongs_to :user class_name "admin"

	validates :start_date,
	precence: true,
	#start_date_valid
	#start_date_present

	validates :duration,
	precence: true,
	validate :duration_multiple_of_5?
	#positive

	validates :title,
	precence: true,
	length: {minimum: 5, maximum: 140}

	validates :description,
	precence: true,
	length: {minimum: 20, maximum: 1000, message: "Veuillez saisir une description de longueur comprise entre 20 et 1000 caractères"}

	validates :price,
	precence: true,
	#value: {minimum: 1, maximum: 100, message: "Le prix ne peut être inférieur à 1 ni supérieur à 1000"}

	validates :location,
	precence: true

	private

	def start_date_is_valid_datetime
        errors.add(:start_date, 'must be a valid datetime') if ((DateTime.parse(start_date) rescue ArgumentError) == ArgumentError)
        puts ":start_date => #{:start_date}"
        puts "start_date => #{start_date}"
    end

    def start_date_is_greater_than_today 
        errors.add(start_date, "can't be past") if start_date < Time.now
    end

    def duration_multiple_of_5?
        duration >= 0 && duration % 5 === 0 ? true : false
    end
end
