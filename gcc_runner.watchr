                                
['fileutils', '/home/martyn/ff04/branches/new_structure/lib/safety/test_runner/auto/colour_prompt'].each { |r| require r }
RAKE_BAT             = 'C:/ruby/bin/rake.bat'
RAKE_LINUX_CONFIG    = 'config[project.yml]'        
RAKE_W32_CONFIG      = 'config[project.yml]'        
RAKE_CLEAN           = 'clean --quiet'
# RAKE_UNITS           = 'unit -f test_runner/config/safety_rakefile.rb'
RAKE_UNITS           = ''

# rake config[test_runner/config/safety_gcc.yml] unit -f test_runner/config/safety_rakefile.rb

module TestPaths
  # SAFETY_RAKEFILE    = '^test_runner\/config\/safety_rakefile.rb'
  # RAKEFILE_HELPER    = '^test_runner\/config\/rakefile_helper.rb'
  # TEST_FILE_FILTER   = '^test_runner/config/test_file_filter.yml'
  # SAFETY_GCC_YML     = '^test_runner/config/safety_gcc.yml'
  # CON                = '^COND(\/.*){3}\.[cChH]' 
  # ADC                = '^ADC(\/.*){3}\.[cChH]' 
  # I2C                = '^I2C(\/.*){3}\.[cChH]' 
  # SEN                = '^SEN(\/.*){3}\.[cChH]' 
  # SIM                = '^SIM(\/.*){3}\.[cChH]' 
  # RTS                = '^RTS(\/.*){3}\.[cChH]' 
  # TIC                = '^TIC(\/.*){3}\.[cChH]'  
  # TOP                = '^TOP(\/.*){3}\.[cChH]' 
  # ALM                = '^ALM(\/.*){3}\.[cChH]' 
  # TRITEQ             = '^Triteq(\/.*){2}\.[cChH]' 
  # UIP                = '^UIP(\/.*){3}\.[cChH]' 
  # TESTS              = '^test\/.*\/test_.*\.[cC]'
  # UNITY              = '^test_runner\/src\/.+\.[ch]'
  # AUTO               = '^test_runner\/auto\/.+\.rb'
  # PRETTY_OUTPUT      = '^test_runner\/auto\/pretty_output.rb'
  # LABEL_GENERATOR    = '^test_runner\/utility\/sha_id_generator.rb'
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

@avoid_rerun = FALSE

def title_generator(source_file)
  in_file, out, conversion_required = nil, "", false
  
  File.open(source_file,'r') do |f|
    in_file = f.readlines
  end
  in_file.each do |line|
    if line[0..1] == 't '
      r = /^t\s(.+)\s*$/
      if line =~ r 
        conversion_required = true
        puts "converting #{line}"
#        out << "/*    #{line.scan(r)[0][0].chomp.to_s}\n */\n"
        out << "void test_#{line.scan(r)[0][0].chomp.to_s.gsub('_', '__').gsub(" ", "_")}(void)\n{\n\n}\n"
      end 
    else
      out << line
    end 
  end
  if conversion_required == true
    colour_print :narrative, "converting test "
    colour_puts  :silver, "   #{source_file}\n\n"
    @avoid_rerun = TRUE 
    FileUtils.rm(source_file)
    sleep 2
    File.open(source_file,'w') { |f| f << out}
  end
end
 
#   #   #   #   #   #   #   #   
    
TestPaths.constants.map do |c| 
  watch(TestPaths.const_get(c)) do |md|
    if @avoid_rerun
      @avoid_rerun = FALSE
    else
      colour_print :narrative, "\nactivated by "
      colour_puts  :silver, "      #{md}\n\n"
      title_generator(md.to_s);
      if md.to_s == "test_runner/utility/sha_id_generator.rb"
        colour_print :narrative, "\nupdating labels"
        `ruby #{md}`
      end
      run_rake 
    end
  end 
end
 
  
