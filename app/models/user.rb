class User < ApplicationRecord
	validates :name,  presence: true
	has_many :created_events, class_name: "Event", dependent: :destroy
	has_and_belongs_to_many :attended_events, class_name: "Event"


	validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

end
