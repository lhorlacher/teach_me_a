class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, except: [:index, :show]
	before_action :set_student, only: [:index, :new, :create, :destroy]
	before_action :set_lesson, only: [:show, :edit, :update, :destroy]

	def index
		@lessons = @student.lessons.order('date DESC')
		@header = "Lessons"
	end

	def show
		@assignments = @lesson.assignments
		@header = "Lesson"
	end

	def new
		@lesson = Lesson.new
		@header = "New Lesson"
	end

	def create
		@lesson = @student.lessons.new(lesson_params)

		if @lesson.save
			redirect_to lesson_path(@lesson)
		else
			render :new
		end
	end

	def edit
		@header = "Edit Lesson"
	end

	def update
		if @lesson.update(lesson_params)
			redirect_to lesson_path(@lesson)
		else
			render :edit
			redirect_to lesson_path(@lesson)
		end
	end

	def destroy
		@lesson.destroy
		redirect_to lesson_path(@student)

	end

	private

	def set_lesson
		@lesson = Lesson.find(params[:id])
	end

	def set_student
		if current_user.is_student?
			@student = current_user
		else
			@student = User.find(params[:student_id])
		end
	end

	def lesson_params
		params.require(:lesson).permit(:date, :feedback, :user_id, :teacher_id)
	end

	def check_permissions
		unless current_user.is_teacher?
			redirect_to lessons_path(current_user.lessons)
		end
	end
end
