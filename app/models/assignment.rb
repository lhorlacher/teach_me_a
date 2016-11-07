class Assignment < ApplicationRecord
	belongs_to :lesson
	has_many :practices
	validates_presence_of :book, :page

	def fill
		count = self.practices.count
		needed = self.per_day * self.per_week
		percent = (count.to_f / needed.to_f * 100).to_i
		percent <= 100 ? percent : 100
	end
end
