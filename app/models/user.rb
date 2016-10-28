class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_one :profile

    def lessons
      Lesson.where(student_id: id)
    end

    def students
    	User.where(teacher_id: current_user.id)
    end
end
