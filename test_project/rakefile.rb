load '../ceedling/lib/rakefile.rb'

#[:project][:build_root, 'build']
#[:paths][:source, 'src']
#[:paths][:test, 'test']

task :default => ['test:all', :release] # ex. run all tests & build release artifact
     # namespaced tasks must be quoted
     # top-level tasks are Ruby symbols denoted by a leading ':'
