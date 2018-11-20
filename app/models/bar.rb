class Bar < ApplicationRecord
	validates :name, presence: true
	validates :description, presence: true
	validates :address, presence: true
end
