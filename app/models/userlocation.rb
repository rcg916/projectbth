class Userlocation < ApplicationRecord
	validates :searchterm, presence: true
	validates :withindistance, presence: true
end
