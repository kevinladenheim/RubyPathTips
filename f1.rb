# useful and related CLI commands
# echo $PATH
# pwd
# cd -
# cd ~
# cd ..
# which pwd, etc.

# Example: which ruby
# Example: rvm use ruby 1.9.3
# Example: which ruby
# Directories shown by echo $PATH are searched until executables
# like rvm are found (or not found). "which rvm" will show the
# full path to rvm if that path is in $PATH. Add new paths to $PATH
# in ~/.basrc. "source ~/.bashrc" to reload.

# Example assumes Ruby 1.9.3

# Directory tree for this example: 
# current working dir (CWD) contains Ruby program
# f1.rb
# f2.rb
# f4.rb
# /lib
#   f3.rb
#   f5.rb

# needs file extension
# if not absolute path, searches paths in $:, if found, executes file 
# can load and execute same file multiple times, no tracking
load "f2.rb"
load "./lib/f5.rb"

# Is there any good reason to use load?

# require & require_relative are smart, will load each file once
# $LOADED_FEATURES has paths of what has been loaded.
# do not need file extension, .so, .o, .dll are being tried
# same file, different extensions would require extensions
require "./lib/f3"

# require_relative is automatically relative to CWD where require needs
# ./ prepended
#require "./f4"
require_relative "f4"

def f1()
  puts "Hello from f1"
end

f1()
f2()
f3()
f4()
f5()

puts RbConfig::CONFIG['rubylibdir']

# compare with "which ruby" at the bash prompt
puts RbConfig::CONFIG['bindir']

puts "\n\nRuby Load path, same as $LOAD_PATH ($:) different from bash $PATH."
puts "The $LOAD_PATH does not contain the Current Working Directory ."
puts "and is used to search for the targets of require and load statements."
puts "require_relative searches the current working directory"
puts "in addition to the directories in $LOAD_PATH\n\n"
puts $:

puts "\n\nThe paths of everything already loaded and excuted:"
puts $LOADED_FEATURES 

# RubyGems is a package manager for Ruby libraries. Usage is similar to apt-get.
# Example: gem list --local, list all installed gems
# Example: gem env, list settings, including GEM PATHS
# Example: echo $GEM_HOME
# Gem.path is a variable available in a Ruby program

# To find location of the rvm gem: gem which rvm
# gem which is searching both gem repositories and rub library directories

