class PracticesController < ApplicationController

	def create
		practice = practice.new
		if practice.save
			redirect_to lesson_path(params[:lesson_id])
		else 
			view = ActionView::Base.new(ActionController::Base.view_paths, {})
			view.render(file: '../views/lessons/show.html.haml')
			flash[:warn] = "Practice not recorded"
	end

	def delete
		@assignment = Assignment.find(params[:assignment_id])
		if @assignment.practices.length >= params[:amount].to_i
			practices = Practice.where(assignment_id: @assignment.id).limit(param[:amount])
			ids = []
			practices.each do |practice|
				ids << practice.id
			end
			Practice.destroy(ids)
		else
			flash[:warn] = "You don't have that many to delete!"
		end			
	end
end