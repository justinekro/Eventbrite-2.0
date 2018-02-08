class User < ApplicationRecord
	validates :name,  presence: true
	has_many :created_events, class_name: "Event"
	has_and_belongs_to_many :attended_events, class_name: "Event"
end
