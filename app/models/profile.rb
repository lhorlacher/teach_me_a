class Profile < ApplicationRecord
	belongs_to :user
	validates_presence_of :birthday, :gender, :instrument, :bio, :user_id

	has_attached_file :profile_picture,
	              styles: { thumb: ["90x90#", :jpg], standard: ["200x200#", :jpg] }

	validates_attachment :profile_picture,
	                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	def user
		User.find(user_id)
	end

	
end
