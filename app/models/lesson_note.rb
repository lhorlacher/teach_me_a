class LessonNote < ApplicationRecord
	belongs_to :lesson

	def lesson
		Lesson.find(lesson_id)
	end

	def fill
		total_count = 0
		lesson = Lesson.includes(:assignments, :practices).find(lesson_id)
		lesson.assignments.each do |assignment|
			total_count += assignment.per_day * assignment.per_week
		end
		percent = lesson.practices.count.to_f / total_count.to_f * 100
		percent <= 100 ? percent : 100
	end

end
