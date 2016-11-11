class Lesson < ApplicationRecord
	belongs_to :teacher, class_name: 'User'
	belongs_to :student, class_name: 'User'
	has_many :assignments
	has_many :practices, :through => :assignments
	has_many :lesson_notes
	validates_presence_of :date

	def self.historical_performance(student_id)
		lessons = Lesson.joins(:assignments).select(
			"lessons.id, lessons.date, 
			(sum(assignments.per_day) * sum(assignments.per_week)) as to_practice"
			).group("lessons.date, lessons.id"
			).where(student_id: student_id).limit(8).order("lessons.date DESC")
		output = [['Date', '% Practiced']]
		lessons.each do |lesson|
			output << [lesson.date, ((lesson.practices.count / lesson.to_practice.to_f) * 100).to_i]
		end
		output
	end


end
