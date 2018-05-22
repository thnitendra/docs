#!/usr/bin/ruby -w

# command to open ruby shell: irb
# execute this script type: ruby hello.rb


puts "Hello, Ruby!";

require 'date'; 
#var=DateTime.strptime("2018-04-03 09:18:33.499" + "+00:00","%F %T.%L%z");
#puts var;
#var=DateTime.strptime("2018-04-03 09:18:33.499" + "+00:00","%F %T.%L%z").strftime('%s');
#puts var;

#var=DateTime.strptime("2018-04-03 09:18:33,499" + "+00:00","%F %T,%L%z");
#puts var;
#var=DateTime.strptime("2018-04-03 09:18:33,499" + "+00:00","%F %T,%L%z").strftime('%s');
#puts var;

var=DateTime.strptime("2018-04-03 10:46:12,207" + "+09:00","%F %T,%L%z");
puts var;
var=DateTime.strptime("2018-04-03 10:46:12,207" + "+09:00","%F %T,%L%z").strftime('%s');
puts var;
var=DateTime.strptime("2018-04-03 10:46:12,207" + "+09:00","%F %T,%L%z").strftime('%F %T.%L%z');
puts var;

