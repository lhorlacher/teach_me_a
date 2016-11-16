class LessonsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_permissions, except: [:index, :show]
	before_action :set_student, only: [:index, :new, :create, :destroy]
	before_action :set_lesson, only: [:show, :edit, :update, :destroy, :update_rating]

	def index
		@lessons = @student.lessons.includes(:assignments).order('date DESC')
		@performance = Lesson.historical_performance(@student.id).to_json
		@links = {header: 'Lessons', 
			nav_link: current_user.teacher ? {display: 'To Students', url: '/students'} : nil}
	end

	def show
		@assignments = @lesson.assignments
		@student = @lesson.student
		@links = {header: 'Lesson', nav_link: {display: 'To Student', url: "/students/#{@student.id}/lessons"} }
	end

	def new
		@lesson = Lesson.new
		@links = {header: "New Lesson", nav_link: {display: 'To Student', url: "/students/#{@student.id}/lessons"}}
	end

	def create
		@lesson = @student.lessons.new(lesson_params)
		@lesson.teacher_id = current_user.id
		@lesson.student_id = params[:student_id]

		if @lesson.save
			redirect_to lesson_path(@lesson)
		else
			render :new
		end
	end

	def edit
		@links = {header: 'Edit Lesson', nav_link: {display: 'To Student', url: "/lessons/#{@lesson.id}"}}
	end

	def update
		if @lesson.update(lesson_params)
			redirect_to lesson_path(@lesson)
		else
			render :edit
			redirect_to lesson_path(@lesson)
		end
	end

	def update_rating
		if @lesson.update(lesson_params)
			redirect_to lesson_path(@lesson)
		else
			render :show
		end
	end

	def destroy
		@lesson.destroy
		redirect_to student_lessons_path(@student)

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
		params.require(:lesson).permit(:date, :feedback, :user_id, :teacher_id, :rating)
	end

	def check_permissions
		unless current_user.is_teacher?
			redirect_to lessons_path(current_user.lessons)
		end
	end
end
