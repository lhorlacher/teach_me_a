namespace :database_cleanse do
  desc "Destroy all database items and re-seed"
  task wipe: :environment do
  	User.all.destroy_all
  	Profile.all.destroy_all
  	Lesson.all.destroy_all
  	LessonNote.all.destroy_all
  	Assignment.all.destroy_all
  	Practice.all.destroy_all

  	Rake::Task["db:seed"].execute
  end

end
