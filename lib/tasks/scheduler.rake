
desc "This task is called by the Heroku scheduler add-on"
task cleanse: :environment do
	Rake::Task["database_cleanse:wipe"].execute
end
