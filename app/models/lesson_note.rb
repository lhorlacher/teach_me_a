class LessonNote < ApplicationRecord
	belongs_to :lesson

	def lesson
		Lesson.find(lesson_id)
	end

end
