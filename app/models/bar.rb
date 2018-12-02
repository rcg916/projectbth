class Bar < ApplicationRecord
	has_many :brands, dependent: :destroy
	has_many :photos
		
	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude
	after_validation :geocode, :reverse_geocode
	  
	validates :name, presence: true
	validates :description, presence: true
	validates :address, presence: true
end
