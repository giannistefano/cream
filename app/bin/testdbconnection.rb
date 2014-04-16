#!/usr/bin/ruby
require 'mysql'

begin 
  con = Mysql.new('127.0.0.1', 'root', 'root', 'DBCream')
  puts con.get_server_info
  
rescue Mysql::Error => e
  puts e.errno
  puts e.error
  
ensure
  con.close if con
end