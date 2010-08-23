['fileutils', 'ceedling/vendor/unity/auto/colour_prompt'].each { |r| require r }
RAKE_BAT             = 'C:/ruby/bin/rake.bat'
RAKE_LINUX_CONFIG    = 'config[project.yml]'        
RAKE_W32_CONFIG      = 'config[project.yml]'        
RAKE_CLEAN           = 'clean --quiet'
# RAKE_UNITS           = 'unit -f test_runner/config/safety_rakefile.rb'
RAKE_UNITS           = ''
  
#   #   #   #   #   #   #   #   

module TestPaths
  SRC                  = '^src\/.+\.[cChH]' 
  TEST                 = '^test\/.+\.[cChH]' 
  CONFIG               = '^project.yml'
  OUTPUT               = '^plugins(\/.+){1}\.rb' 
end
                                      
colour_print :narrative, "\nroot directory "
colour_puts :silver, "    #{FileUtils.pwd}\n\n"  
  
#   #   #   #   #   #   #   #   

def run_rake
  if RUBY_PLATFORM =~/(win|w)32$/
    system("#{RAKE_BAT} #{RAKE_W32_CONFIG} #{RAKE_CLEAN} #{RAKE_UNITS}")
  else
#    system("rake #{RAKE_LINUX_CONFIG} #{RAKE_CLEAN} #{RAKE_UNITS} ")
    system("rake")
  end
end

#   #   #   #   #   #   #   #   
    
TestPaths.constants.map do |c| 
  watch(TestPaths.const_get(c)) do |md|
    colour_print :narrative, "\nactivated by "
    colour_puts  :silver, "      #{md}\n\n"
    run_rake 
  end 
end
