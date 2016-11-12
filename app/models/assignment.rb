class Assignment < ApplicationRecord
	belongs_to :lesson
	has_many :practices
	validates_presence_of :book, :page

	def fill
		count = self.practices.count
		needed = self.per_day * self.per_week
		percent = (count.to_f / needed.to_f * 100).to_i
		return (percent <= 100 ? percent : 100)
	end

	def duplicate
		assignment = Assignment.new(book: book, per_day: per_day, per_week: per_week, page: page, instruction: instruction)
	end

	def lesson
		Lesson.find(lesson_id)
	end
end
