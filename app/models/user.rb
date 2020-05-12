class User < ApplicationRecord
    after_create :welcome_send

	has_many :attendances
	has_many :events, through: :attendances
	has_many :envents, foregin_key: "admin_id" class_name: "Event"

	validates :email, 
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez saisir une adresse email au format valide" },
    presence: true,
    length: { maximum: 256 }

    validates :encrypted_password, 
    presence: true,
    length: { maximum: 50 }

    validates :description,
    presence: true,
    length: {in: 10..500}

    validates :first_name,
    presence: true,
    length: {in: 2..30},
    # # exclusion: {in: /^[-+]?\d*$/}

	validates :last_name,
    presence: true,
    length: {in: 2..30},
    # # exclusion: {in: /^[-+]?\d*$/}

    def welcome_send
    UserMailer.welcome_email(self).deliver_now
    end
end
