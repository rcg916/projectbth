class Photo < ApplicationRecord
	belongs_to :bar

	mount_uploader :picture, PictureUploader

	validates :picture, presence: true
	validates :caption, presence: true
end
