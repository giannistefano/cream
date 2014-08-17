require 'tk'
require 'tkextlib/tile'

enteramountscreen = TkRoot.new {title "C.R.E.A.M."}
content = Tk::Tile::Frame.new(enteramountscreen) {padding "3 3 12 12"}.grid( :sticky => 'nsew')
TkGrid.columnconfigure enteramountscreen, 0, :weight => 1; TkGrid.rowconfigure enteramountscreen, 0, :weight => 1

# define all variables - start
$currvalue = TkVariable.new
$currvaluereset = TkVariable.new  
$prevvalue = TkVariable.new
$action = TkVariable.new
$commaset = TkVariable.new
$actoperf = TkVariable.new 
$overview = TkVariable.new
#$sv_fname  = TkVariable.new 
#initialize screen variables - start 
$currvalue.value = 0
$prevvalue.value = 0
$actoperf.value = ' '
$currvaluereset = 'y' 
#initialize screen variables - end 

# define all variables - end

#define initial values for variables - start
$svcalc = '0'
#define initial values for variables - end

# screens are built top-down left-right
# create all widgets that will populate the frame - start

# create notebook style frame
notebook = Tk::Tile::Notebook.new(content).grid( :column => 0, :row => 0, :sticky => 'w')

# create tab 1 - cash register tab
kassatab = Tk::Tile::Frame.new(notebook); # page

# create tab 2 - user management tab
userstab = Tk::Tile::Frame.new(notebook); # page

#add tabs to notebookframe
notebook.add userstab, :text => 'Gebruikers'
notebook.add kassatab, :text => 'Kassa'

# ----------------------------------------------------------------------------------------
# populate kassatab ----------------------------------------------------------------------
# ----------------------------------------------------------------------------------------
# create the button with consumptions to be added:
Tk::Tile::Button.new(kassatab) {text '+ bier'; command {manageconsumption('1.60','+','bier')}}.grid( :column => 0, :row => 0, :sticky => 'w')

Tk::Tile::Button.new(kassatab) {text '+ cola'; command {manageconsumption('2.55','+', 'cola')}}.grid( :column => 1, :row => 0, :sticky => 'w')

Tk::Tile::Button.new(kassatab) {text '+ wijn'; command {manageconsumption('0.25','+', 'wijn')}}.grid( :column => 2, :row => 0, :sticky => 'w')

Tk::Tile::Button.new(kassatab) {text '+ water'; command {manageconsumption('400.68','+', 'water')}}.grid( :column => 3, :row => 0, :sticky => 'w')

# create the button with consumptions to be subtracted:
Tk::Tile::Button.new(kassatab) {text '- bier'; command {manageconsumption('1.60','-','bier')}}.grid( :column => 0, :row => 1, :sticky => 'w')

Tk::Tile::Button.new(kassatab) {text '- cola'; command {manageconsumption('2.55','-','cola')}}.grid( :column => 1, :row => 1, :sticky => 'w')

Tk::Tile::Button.new(kassatab) {text '- wijn'; command {manageconsumption('0.25','-','wijn')}}.grid( :column => 2, :row => 1, :sticky => 'w')

Tk::Tile::Button.new(kassatab) {text '- water'; command {manageconsumption('400.68','-','water')}}.grid( :column => 3, :row => 1, :sticky => 'w')

# create the calculator inputfield overview 
tl_overview = Tk::Tile::Entry.new(kassatab) {width 7; textvariable $overview}.grid( :column => 4, :columnspan => 4, :row => 0, :sticky => 'we')
# create the calculator inputfield result 
tl_result = Tk::Tile::Entry.new(kassatab) {width 7; textvariable $currvalue}.grid( :column => 4, :columnspan => 3, :row => 1, :sticky => 'we')

# create the button with value backspace
Tk::Tile::Button.new(kassatab) {text '<-'; command {delete1digit}}.grid( :column => 7, :row => 1, :sticky => 'w')

# create the button with value 1
Tk::Tile::Button.new(kassatab) {text '1'; command {managedigit('+','1')}}.grid( :column => 4, :row => 2, :sticky => 'w')
# create the button with value 2
Tk::Tile::Button.new(kassatab) {text '2'; command {managedigit('+','2')}}.grid( :column => 5, :row => 2, :sticky => 'w')
# create the button with value 3
Tk::Tile::Button.new(kassatab) {text '3'; command {managedigit('+','3')}}.grid( :column => 6, :row => 2, :sticky => 'w')
# create the button with value %
Tk::Tile::Button.new(kassatab) {text '%'; command {manageaction('%')}}.grid( :column => 7, :row => 2, :sticky => 'w')

# create the button with value 4
Tk::Tile::Button.new(kassatab) {text '4'; command {managedigit('+','4')}}.grid( :column => 4, :row => 3, :sticky => 'w')
# create the button with value 5
Tk::Tile::Button.new(kassatab) {text '5'; command {managedigit('+','5')}}.grid( :column => 5, :row => 3, :sticky => 'w')
# create the button with value 6
Tk::Tile::Button.new(kassatab) {text '6'; command {managedigit('+','6')}}.grid( :column => 6, :row => 3, :sticky => 'w')
# create the button with value -
Tk::Tile::Button.new(kassatab) {text 'x'; command {manageaction('x')}}.grid( :column => 7, :row => 3, :sticky => 'w')

# create the button with value 7
Tk::Tile::Button.new(kassatab) {text '7'; command {managedigit('+','7')}}.grid( :column => 4, :row => 4, :sticky => 'w')
# create the button with value 8
Tk::Tile::Button.new(kassatab) {text '8'; command {managedigit('+','8')}}.grid( :column => 5, :row => 4, :sticky => 'w')
# create the button with value 9
Tk::Tile::Button.new(kassatab) {text '9'; command {managedigit('+','9')}}.grid( :column => 6, :row => 4, :sticky => 'w')
# create the button with value x
Tk::Tile::Button.new(kassatab) {text '-'; command {manageaction('-')}}.grid( :column => 7, :row => 4, :sticky => 'w')

# create the button with value 0
Tk::Tile::Button.new(kassatab) {text '0'; command {managedigit('+','0')}}.grid( :column => 4, :row => 5, :sticky => 'w')
# create the button with value ,
Tk::Tile::Button.new(kassatab) {text ','; command {add1digit('.')}}.grid( :column => 5, :row => 5, :sticky => 'w')
# create the button with value =
Tk::Tile::Button.new(kassatab) {text '='; command {calcresult}}.grid( :column => 6, :row => 5, :sticky => 'w')
# create the button with value +
Tk::Tile::Button.new(kassatab) {text '+'; command {manageaction('+')}}.grid( :column => 7, :row => 5, :sticky => 'w')

# create the button with value c
Tk::Tile::Button.new(kassatab) {text 'c'; command {resetcalc}}.grid( :column => 4, :row => 6, :sticky => 'w')
# ----------------------------------------------------------------------------------------
# # end populate kassatab ----------------------------------------------------------------
# ----------------------------------------------------------------------------------------
# set kassatab as selected tab
notebook.select(kassatab)

# ----------------------------------------------------------------------------------------
# start business logic -------------------------------------------------------------------
# ----------------------------------------------------------------------------------------
TkWinfo.children(kassatab).each {|w| TkGrid.configure w, :padx => 5, :pady => 5}
tl_result.focus
enteramountscreen.bind("Return") {calcresult}
#add overview
def calcresult
  begin
     puts 'calculate result'
     $currvaluereset = 'y'
     $commaset = ' '
     puts 'act to perform ' + $actoperf
     #$tl_overview.value = 'result'
     puts 'previous value <' + $prevvalue.to_s + '>'
     if $actoperf == 'add' 
        puts 'adding ' + $prevvalue.to_s + ' to ' + $currvalue.to_s
        $svcalc = $prevvalue + $currvalue
     end
     if $actoperf == 'subtract' 
        puts 'subtracting'
        $svcalc = $prevvalue - $currvalue
     end
     if $actoperf == 'multiply' 
        puts 'multiplying'
        $svcalc = $prevvalue * $currvalue
     end
     if $actoperf == 'divide' 
        puts 'dividing'
        $svcalc = $prevvalue / $currvalue 
     end
     
     if $svcalc < 0
       $svcalc = 0
     end
     puts 'current value change to ' + $svcalc.to_s 
     $currvalue.value = $svcalc
        
     $prevvalue.value = $currvalue
     puts '2 prev value change to ' + $prevvalue.to_s     
  rescue
     puts 'calculate result error <' + $svcalc.to_s + '>'
     #$tl_overview.value = 'rescue 1'
  end
end

def managedigit(digitaction, digit)
  begin
     puts 'managedigit direction <' + digitaction + '> digit <' + digit +'>'
     # if the comma-value has been entered at least once
     if digitaction == '+'
       if (digit == '.' and $commaset == '1')
           puts 'can not enter more than 1 comma'  
       else
         if digit == '.'
           $commaset = '1'
         end   
         # if the input field is at its initial 0-value replace the digit instead of concatenating it
         #if $svcalc == '0'
         if $currvaluereset == 'y'
           $currvaluereset = 'n' 
           $svcalc = digit
         else  
           $svcalc = $svcalc + digit
         end  
       end 
     else
       $svcalc.chop
       if $svcalc.length == 0
         $svcalc = 0
       end   
     end 
     $currvalue.value = $svcalc  
     puts 'svcalc value value ' + $svcalc.to_s   
  rescue
     puts 'add 1 digit error'
     puts 'prevvalue ' + $prevvalue.to_s 
     puts 'currvalue ' + $currvalue.to_s 
     puts 'commaset ' +$commaset.to_s 
     puts 'svcalc ' + $svcalc.to_s 
  end
end

def delete1digit
  begin
     puts 'delete 1 digit'
     $svcalc 
  rescue
     puts 'delete 1 digit error'
  end
end

def manageaction (action)
  begin
    calcresult
    setaction(action)
  end
end

def manageconsumption(price, action, description)
  begin 
    managedigit('+', price)
    setaction(action)
    calcresult
    updateoverview(description, action)
  end
end

def setaction(action)
  begin 
     puts 'setaction <' + action + '>'
     $actoperf = case action
     when '+'
       $actoperf = 'add'
     when '-'
       $actoperf = 'subtract'
     when 'x'
       $actoperf = 'multiply'
     when '%' 
       $actoperf = 'divide'
     else
       $actoperf = 'unknown action'
     end 
     puts $actoperf
  end
end

def resetcalc
  begin
    $prevvalue.value = 0
    $currvalue.value = 0
    $svcalc = 0
    $currvaluereset = 'y'
  end
end

def updateoverview (description, action)
  begin
    $overview.value = $overview + action + description
  end
end
# ----------------------------------------------------------------------------------------
# end business logic -------------------------------------------------------------------
# ----------------------------------------------------------------------------------------


Tk.mainloop