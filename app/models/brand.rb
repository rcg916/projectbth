class Brand < ApplicationRecord
	belongs_to :bar

	validates :name, presence: true
	validates :brandtype, presence: true
end
