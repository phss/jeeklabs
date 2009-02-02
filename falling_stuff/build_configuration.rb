configuration do |c|
  c.project_name = 'FS'
  c.output_dir = 'package'
  c.main_ruby_file = 'fs.rb'
  c.main_java_file = 'org.rubyforge.rawr.Main'

  # Compile all Ruby and Java files recursively
  # Copy all other files taking into account exclusion filter
  c.source_dirs = ['bin', 'lib', 'src']
  c.source_exclude_filter = []

  c.compile_ruby_files = true
  #c.java_lib_files = []  
  c.java_lib_dirs = ['lib/java']
  c.files_to_copy = Dir.glob('lib/java/native_files/*')

  c.target_jvm_version = 1.5
  c.jars[:resources] = { :directory => 'resources', :location_in_jar => 'resources', :exclude => /bak/}
  c.jvm_arguments = "-Djava.library.path=java/lib/native_files -XX:+UseConcMarkSweepGC -Djruby.compile.mode=FORCE -server -Xms256m -Xmx512m"
  # c.jvm_arguments = "-Djava.library.path=Test.app/Contents/Resources/Java/lib/native_files -XX:+UseConcMarkSweepGC -Djruby.compile.mode=FORCE -server -Xms256m -Xmx512m"
  # Bundler options
  # c.do_not_generate_plist = false
end
