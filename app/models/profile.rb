class Profile < ApplicationRecord
	belongs_to :user
	validates_presence_of :birthday, :gender, :instrument, :bio, :user_id

	has_attached_file :profile_picture,
	              styles: { thumb: ["64x64#", :jpg], standard: ["200x200#", :jpg] }

	validates_attachment :profile_picture,
	                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	def user
		User.find(user_id)
	end

	
end
