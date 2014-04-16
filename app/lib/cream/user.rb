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
# includes end --------------------------------------
class User
  @@no_of_users
  
  # create a new user object
  def initialize(auth_level, fnam, lnam)
    @userid=99
    @auth_Level=auth_level
    @fnam=fnam
    @lnam=lnam
    puts 'just created 1 user object'
  end
  
  #insert a record into the table tbl_consumptions
  def store
    puts 'trying to store a user'
    Tbl_users.create(:colauthlevel => @auth_Level, :colfnam => @fnam, :collnam => @lnam)
    puts 'after having stored a user'
  end
  
  def setlname
    begin
       puts 'aaaaaa'
       $sv_lname.value = 'Stefano'
    rescue
       puts 'bbbbbb'
       $sv_lname.value = ''
    end
  end
    
#  puts 'total number of users created <' + no_of_users + '>'
end

# aUser = User.new(10, 'Gianni', 'Stefano')
# aUser.store