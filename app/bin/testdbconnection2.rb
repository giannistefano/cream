#!/usr/bin/ruby
require 'mysql'
require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql',
  :database => 'DBCream',
  :username => 'root',
  :password => 'root',
  :host     => 'localhost',
  :socket   => '/Applications/MAMP/tmp/mysql/mysql.sock')

#create the model relation object for table tbl_consumptions
class Tbl_consumptions < ActiveRecord::Base
  puts 'connection ok'
end

#insert a record into the table tbl_consumptions
Tbl_consumptions.create(:colprice => 15.123, :coldescription => 'Jupiler 25cl', :coluserid => '1')

consumption = Tbl_consumptions.first
puts consumption.colprice

Tbl_consumptions.first.destroy