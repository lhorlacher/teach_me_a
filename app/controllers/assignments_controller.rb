class AssignmentsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, except: [:index, :show]
	before_action :set_lesson, only: [:index, :show, :new, :create]
	before_action :set_student, only: [:index, :show]

	def show
	end

	private

	def set_lesson
		@lesson = Lesson.find(params[:lesson_id])
	end

	def set_student
		if current_user.is_student?
			@student = current_user
		else
			@student = User.find(@lesson.student_id)
		end
	end

	def check_permissions
		unless current_user.is_teacher?
			redirect_to lessons_path(current_user.lessons)
		end
	end

end
