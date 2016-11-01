class StudentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@students = User.students(current_user.id)
	end

end
