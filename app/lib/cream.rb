# program description start -------------------------
# description : main program for cream application
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
require './cream/dbcream'
require './cream/user'
require './cream/testparams'
require './cream/screen'
# includes end --------------------------------------

puts 'cream - create new user object'
aUser = User.new(10, 'Gianni', 'Stefano')
puts 'cream - store the new user object'
aUser.store

