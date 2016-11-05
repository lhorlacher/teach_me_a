class AssignmentsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, except: [:show]
	before_action :set_lesson, only: [:new, :create]
	before_action :set_assignment, only: [:show, :edit, :update, :destroy]

	def show
		@header = 'Assignment'
	end

	def new
		@header = 'New Assignment'
		@assignment = @lesson.assignments.new
	end

	def create
		assignment = @lesson.assignments.new(assignment_params)
		if assignment.save
			redirect_to lesson_path(assignment.lesson_id)
		else
			render :new
		end
	end

	def edit
		@header = 'Edit Assignment'
	end

	def update
		if @assignment.update(assignment_params)
			redirect_to lesson_path(@assignment.lesson_id)
		else
			render :edit
		end
	end

	def destroy
		@assignment.destroy
	end

	private

	def assignment_params
		params.require(:assignment).permit(:book, :page, :per_day, :per_week, :instruction)
	end

	def set_assignment
		@assignment = Assignment.find(params[:id])
	end

	def set_lesson
		@lesson = Lesson.find(params[:lesson_id])
	end

	def check_permissions
		unless current_user.teacher
			redirect_to student_lessons_path(current_user.lessons)
		end
	end

end
