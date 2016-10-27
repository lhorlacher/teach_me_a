class StudentsController < ApplicationController
	before_action :authenticate_user!

	def index
		@current_user.students
	end

end
