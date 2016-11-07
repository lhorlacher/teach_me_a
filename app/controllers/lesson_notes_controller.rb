class LessonNotesController < ApplicationController
	before_action :authenticate_user!
	before_action :verify_teacher
	before_action :set_lesson, only: [:new, :create]
	before_action :set_lesson_note, only: [:show, :edit, :update, :destroy]

	def student_index
		@student = User.find(params[:student_id])
		@lesson_notes = @student.lesson_notes.joins("INNER JOIN lessons ON lesson_notes.lesson_id = lessons.id").order("lessons.date")
		@links = {header: 'Lesson Notes', nav_link: {display: 'To Students', url: "/students"}}
	end

	def new
		@links = {header: 'New Note', nav_link: {display: 'To Lesson', url: "/lessons/#{@lesson.id}"}}
		@lesson_note = LessonNote.new
	end

	def create
		lesson_note = LessonNote.new(lesson_note_params)
		if lesson_note.save
			redirect_to lesson_path(lesson_note.lesson_id)
		else
			render :new
		end
	end

	def edit
		@links = {header: 'Edit Note', nav_link: {display: 'To Lesson', url: "/lessons/#{@lesson_note.lesson_id}"}}
	end

	def update
		if @lesson_note.update(lesson_note_params)
			redirect_to lesson_path(@lesson_note.lesson_id)
		else
			render :edit
		end
	end

	def destroy
		@lesson_note.destroy
	end

	private

	def verify_teacher
		unless current_user.teacher
			redirect_to student_lessons_path(current_user.lessons)
		end
	end

	def set_lesson
		@lesson = Lesson.find(params[:lesson_id])
	end

	def set_lesson_note
		@lesson_note = LessonNote.find(params[:id])
	end

	def lesson_note_params
		params.require(:lesson_note).permit(:notes)
	end



end
