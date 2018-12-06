class Brand < ApplicationRecord
	belongs_to :bar

	validates :name, presence: true
	validates :brandtype, presence: true

	BRANDTYPE = {
		'Craft Beer': 'beer',
		'Premium Vodka': 'vodka'
	}

	def inv_brandtype
		BRANDTYPE.invert[self.brandtype]
	end
end
