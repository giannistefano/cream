require 'tk'
require 'tkextlib/tile'

root = TkRoot.new {title "Manage user"}
content = Tk::Tile::Frame.new(root) {padding "3 3 12 12"}.grid( :sticky => 'nsew')
TkGrid.columnconfigure root, 0, :weight => 1; TkGrid.rowconfigure root, 0, :weight => 1

$feet = TkVariable.new; $meters = TkVariable.new

# define all variables - start
$sv_fname 	= TkVariable.new 
$sv_lname 	= TkVariable.new
$sv_auth_array	= TkVariable.new
$sv_user_array 	= TkVariable.new
$lv_sel_user  	= TkVariable.new
$lv_fname  	= TkVariable.new
$lv_lname  	= TkVariable.new
$lv_auth  	= TkVariable.new

$lv_sel_user = 'gebruiker 1'
$lv_fname   = 'first name'
$lv_lname   = 'last name'
$lv_auth    = 'authorisation'
# define all variables - end

# screens are built top-down left-right
# create all widgets that will populate the frame - start
# create the label select user tile 
Tk::Tile::Label.new(content) {textvariable $lv_sel_user}.grid( :column => 1, :row => 1, :sticky => 'we');


# create the label select user tile 
# #Tk::Tile::Label.new(content) {textvariable $meters}.grid( :column => 2, :row => 2, :sticky => 'we');
Tk::Tile::Label.new(content) {text $lv_sel_user}.grid( :column => 1, :row => 1, :sticky => 'we');

# create the label first name tile 
Tk::Tile::Label.new(content) {text $lv_fname}.grid( :column => 1, :row => 2, :sticky => 'we');

# create the label authority tile 
Tk::Tile::Label.new(content) {text $lv_auth}.grid( :column => 1, :row => 3, :sticky => 'we');

# create the dropdownlist select user tile 
tl_user = Tk::Tile::Entry.new(content) {width 7; textvariable $sv_user_array}.grid( :column => 2, :row => 1, :sticky => 'we' )

# create the textfield first name tile 
tl_fnam = Tk::Tile::Entry.new(content) {width 7; textvariable $sv_fname}.grid( :column => 2, :row => 2, :sticky => 'we' )

# create the dropdownlist authority tile 
tl_auth = Tk::Tile::Entry.new(content) {width 7; textvariable $sv_auth_array}.grid( :column => 2, :row => 3, :sticky => 'we' )

# create the label last name tile 
Tk::Tile::Label.new(content) {text $lv_lname}.grid( :column => 3, :row => 2, :sticky => 'we');

# create the textfield last name tile 
tl_lnam = Tk::Tile::Entry.new(content) {width 7; text $sv_lname}.grid( :column => 4, :row => 2, :sticky => 'we' )

# create the button update tile 
tl_auth = Tk::Tile::Entry.new(content) {width 7; text $sv_auth}.grid( :column => 4, :row => 3, :sticky => 'we' )
# create the label select user tile



TkWinfo.children(content).each {|w| TkGrid.configure w, :padx => 5, :pady => 5}
tl_user.focus
root.bind("Return") {set_lname}

def set_lname
  begin
     $tl_lnam.value = 'Stefano'
  rescue
     $tl_lnam.value = ''
  end
end

Tk.mainloop
