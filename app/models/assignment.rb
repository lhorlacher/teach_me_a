class Assignment < ApplicationRecord
	belongs_to :lesson
	validates_presence_of :book, :page
end
