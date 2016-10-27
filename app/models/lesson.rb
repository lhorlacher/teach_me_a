class Lesson < ApplicationRecord
	has_many :assignments
	has_many :lesson_notes
	validates_presence_of :date


end
