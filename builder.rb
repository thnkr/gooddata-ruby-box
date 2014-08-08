# encoding=UTF-8
# GoodData Ruby SDK Environment Builder
require 'io/console'

puts "\n##########################################"
puts "# GOODDATA RUBY SDK: ENVIRONMENT BUILDER #"
puts "##########################################"
puts "Learn more at https://sdk.gooddata.com/gooddata-ruby/"

# User Credentials for GoodData Platform
time = "(#{Time.now.month}/#{Time.now.day}/#{Time.now.year})"
title = "My Ruby SDK Project #{time}"
model = './my_test_project/model/model.rb'
if ARGV[0] && ARGV[1] && ARGV[2]
  user = ARGV[0]
  password = ARGV[1]
  token = ARGV[2]
else
  puts '\nLet\'s start by logging you in and setting up a demo project.'
  puts '\n(1/3) Enter Developer TOKEN (\"https://developer.gooddata.com/trial/\"):'
  token = $stdin.gets.chomp!
  puts '(2/3) GoodData Username:'
  user = $stdin.gets.chomp!
  puts "(3/3) GoodData Password for #{user}: (hidden)"
  password = STDIN.noecho(&:gets).strip!
end

# Check GoodData SDK Installation
begin
  gem "water-works"
  gem "gooddata"
rescue LoadError
  puts "\nGoodData Ruby SDK has not been installed on this machine, would you like to install it? (y/n)"

  # Confirm the use would like to install GoodData
  c = $stdin.gets.chomp
  if c == "y" || c == "yes" || c == ""
    puts "Installing GoodData Ruby SDK..."
  	#system("gem install nokogiri -- --use-system-libraries && gem install gooddata && gem install artii")
  	Gem.clear_paths
  else
    puts 'Cancelled install of GoodData.'
    exit
  end
end

require 'gooddata'
require 'artii'
require 'pp'

# Set up demo project, upload to user's GoodData, update GoodFile
a = Artii::Base.new
puts a.asciify('GoodData SDK')
puts "Downloading demo project..."
system("gooddata scaffold project my_test_project")
updated_model = IO.readlines(model)
updated_model[0] = "GoodData::Model::ProjectBuilder.create(\"#{title}\") do |p|\n"
File.open(model, 'w') { |f|
  updated_model.each { |line| f.puts line }
}

GoodData.connect user, password
puts "Deploying demo project \"#{title}\" for #{user}. This can take up to 2 minutes..."
blueprint = eval(File.read('./my_test_project/model/model.rb')).to_blueprint
project = GoodData::Model::ProjectCreator.migrate(:token => token, :spec => blueprint)
puts "Updating Goodfile..."
File.open('./my_test_project/Goodfile', 'w') do |file|
  file.puts "{\n\"model\" : \"./model/model.rb\",\n\"project_id\" : \"#{project.pid}\"\n}"
end

puts "Setup Complete!"
puts "  User: #{user}"
puts "  Project Title: #{title}"
puts "  Project Identifier: #{project.pid}"