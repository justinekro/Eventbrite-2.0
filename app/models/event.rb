class Event < ApplicationRecord
	belongs_to :creator, class_name: "User", foreign_key: "user_id"
	has_and_belongs_to_many :attendees, class_name: "User"

	validate :date_cannot_be_in_the_past
	validates :name, presence: true
	validates :date, presence: true
	validates :presence, presence: true
	validates :place, presence: true


  	def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
     !date.blank? and date < Date.today
  	end
end
