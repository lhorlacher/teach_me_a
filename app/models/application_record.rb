class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def is_teacher?
  	teacher
  end

  def is_student?
  	!is_teacher?
  end
  
end
