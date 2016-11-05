class LessonNote < ApplicationRecord
	belongs_to :lesson

	def lesson
		Lesson.find(self.lesson_id)
	end

end
