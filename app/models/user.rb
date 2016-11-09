class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    has_one :profile, dependent: :destroy

    has_attached_file :profile_picture,
                  styles: { thumb: ["64x64#", :jpg] }

    validates_attachment :profile_picture,
                         content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

    has_many :lessons
    has_many :teachers, :through => :lessons
    has_many :students, :through => :lessons

    def lessons
      Lesson.where(student_id: id)
    end

    def self.students(id)
    	User.where(teacher_id: id)
    end

    def lesson_notes
      LessonNote.where(lesson_id: Lesson.where(student_id: self.id).pluck(:id))
    end
end
