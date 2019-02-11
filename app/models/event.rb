class Event < ApplicationRecord
	has_many :attendances
	has_many :users, through: :attendances
	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true
	validates :location, presence: true
end
