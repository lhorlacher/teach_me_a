class HomeController < ApplicationController
  def index
  	if current_user
	  	if current_user.teacher
	  		redirect_to students_path
	  	else 
	  		redirect_to student_lessons_path(current_user.id)
	  	end
	end
  end
end
