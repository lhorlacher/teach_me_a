class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_one :profile

    has_many :lessons
    has_many :teachers, :through => :lessons
    has_many :students, :through => :lessons

    def lessons
      Lesson.where(student_id: id)
    end

    def students
    	User.where(teacher_id: current_user.id)
    end
end
