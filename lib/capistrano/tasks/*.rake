if ENV['staging']
	Rake::Task['deploy:assets:precompile'].clear_actions
end