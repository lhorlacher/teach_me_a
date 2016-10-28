class Lesson < ApplicationRecord
	belongs_to :teacher, class_name: 'User'
	belongs_to :student, class_name: 'User'
	has_many :assignments
	has_many :lesson_notes
	validates_presence_of :date


end
