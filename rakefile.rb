load 'ceedling/lib/rakefile.rb'

task :default => ['test:all'] # ex. run all tests & build release artifact
#task :default => ['test:all', :release] # ex. run all tests & build release artifact
     # namespaced tasks must be quoted
     # top-level tasks are Ruby symbols denoted by a leading ':'
  
