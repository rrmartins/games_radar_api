require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |test|
  test.test_files = FileList['spec/lib/games_radar_api/*_spec.rb','spec/lib/games_radar_api/client/*_spec.rb']
  test.verbose = true
end

task :default => :test