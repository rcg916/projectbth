class Bar < ApplicationRecord
	geocoded_by :address
  after_validation :geocode
  
	validates :name, presence: true
	validates :description, presence: true
	validates :address, presence: true
end
