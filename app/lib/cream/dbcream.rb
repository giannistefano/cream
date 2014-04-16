# # program description start -------------------------
# description : this class manages the user object
# author  : Gianni Stefano
# date    : 01/01/2014
# program description end ---------------------------
# ---------------------------------------------------
# mod description start -----------------------------
# mod-author:
# mod-date  :
# mod-reason:
# mod description end -------------------------------
# ---------------------------------------------------
# includes start ------------------------------------
require 'mysql'
require 'active_record'
# includes end --------------------------------------

ActiveRecord::Base.establish_connection(
  :adapter  => 'mysql',
  :database => 'DBCream',
  :username => 'root',
  :password => 'root',
  :host     => 'localhost',
  :socket   => '/Applications/MAMP/tmp/mysql/mysql.sock')

#create the model relation object for table tbl_consumptions
class Tbl_consumptions < ActiveRecord::Base
  if $global_test_flag
    puts 'connection to database DBCream ok'
  end
end

#create the model relation object for table tbl_users
class Tbl_users < ActiveRecord::Base
  if $global_test_flag
    puts 'connection to database users ok'
  end
end

#create the model relation object for table tbl_accounts
class Tbl_accounts < ActiveRecord::Base
  if $global_test_flag
    puts 'connection to database accounts ok'
  end
end

#create the model relation object for table tbl_clients
class Tbl_clients < ActiveRecord::Base
  if $global_test_flag
    puts 'connection to database clients ok'
  end
end