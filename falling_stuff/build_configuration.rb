configuration do |c|
  c.project_name = 'fs'
  c.output_dir = 'build'
  c.main_ruby_file = 'main'
  c.main_java_file = 'org.rubyforge.rawr.Main'

  # Compile all Ruby and Java files recursively
  # Copy all other files taking into account exclusion filter
  c.source_dirs = ['bin', 'src', 'lib']
  c.source_exclude_filter = []

  c.compile_ruby_files = true
  #c.java_lib_files = []  
  c.java_lib_dirs = ['java_lib']
  c.files_to_copy = Dir.glob('java_lib/native_files/*')

  c.target_jvm_version = 1.5
  c.jars[:resources] = { :directory => 'resources', :location_in_jar => 'resources', :exclude => /bak/}
  c.jvm_arguments = "-Djava.library.path=java_lib/native_files -XX:+UseConcMarkSweepGC -Djruby.compile.mode=FORCE -server -Xms256m -Xmx512m"

  # Bundler options
  # c.do_not_generate_plist = false
end
