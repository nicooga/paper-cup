# Dir.glob(['./lib/tasks/*.rake']).each { |r| require r }

require 'rake/testtask'
task default: :test

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/*_test.rb', "test/paper_cup_test/**_test.rb"]
  t.verbose = true
end
