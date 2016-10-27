class Profile < ApplicationRecord
	belongs_to :user
	validates_presence_of :age, :gender, :instrument, :bio, :user_id
end
