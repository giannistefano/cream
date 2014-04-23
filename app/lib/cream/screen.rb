require 'tk'
require 'tkextlib/tile'

enteramountscreen = TkRoot.new {title "Calculator"}
content = Tk::Tile::Frame.new(enteramountscreen) {padding "3 3 12 12"}.grid( :sticky => 'nsew')
TkGrid.columnconfigure enteramountscreen, 0, :weight => 1; TkGrid.rowconfigure enteramountscreen, 0, :weight => 1

# define all variables - start
$currvalue = TkVariable.new
$currvaluereset = TkVariable.new  
$prevvalue = TkVariable.new
$action = TkVariable.new
$commaset = TkVariable.new
$actoperf = TkVariable.new 
#$sv_fname 	= TkVariable.new 
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

# create the label select user tile 
#Tk::Tile::Label.new(content) {text $lv_sel_user}.grid( :column => 1, :row => 1, :sticky => 'we');

# create the button with consumptions to be added:
Tk::Tile::Button.new(content) {text 'bier'; command {manageconsumption('1.60','+')}}.grid( :column => 0, :row => 0, :sticky => 'w')

Tk::Tile::Button.new(content) {text 'cola'; command {manageconsumption('2.55','+')}}.grid( :column => 1, :row => 0, :sticky => 'w')

Tk::Tile::Button.new(content) {text 'wijn'; command {manageconsumption('0.25','+')}}.grid( :column => 2, :row => 0, :sticky => 'w')

Tk::Tile::Button.new(content) {text 'water'; command {manageconsumption('400.68','+')}}.grid( :column => 3, :row => 0, :sticky => 'w')

# create the button with consumptions to be subtracted:
Tk::Tile::Button.new(content) {text 'bier'; command {manageconsumption('1.60','-')}}.grid( :column => 0, :row => 1, :sticky => 'w')

Tk::Tile::Button.new(content) {text 'cola'; command {manageconsumption('2.55','-')}}.grid( :column => 1, :row => 1, :sticky => 'w')

Tk::Tile::Button.new(content) {text 'wijn'; command {manageconsumption('0.25','-')}}.grid( :column => 2, :row => 1, :sticky => 'w')

Tk::Tile::Button.new(content) {text 'water'; command {manageconsumption('400.68','-')}}.grid( :column => 3, :row => 1, :sticky => 'w')


# create the calculator inputfield overview 
tl_overview = Tk::Tile::Entry.new(content) {width 7; textvariable $overview}.grid( :column => 4, :columnspan => 4, :row => 0, :sticky => 'we')
# create the calculator inputfield result 
tl_result = Tk::Tile::Entry.new(content) {width 7; textvariable $currvalue}.grid( :column => 4, :columnspan => 3, :row => 1, :sticky => 'we')

# create the button with value backspace
Tk::Tile::Button.new(content) {text '<-'; command {delete1digit}}.grid( :column => 7, :row => 1, :sticky => 'w')

# create the button with value 1
Tk::Tile::Button.new(content) {text '1'; command {add1digit('1')}}.grid( :column => 4, :row => 2, :sticky => 'w')
# create the button with value 2
Tk::Tile::Button.new(content) {text '2'; command {add1digit('2')}}.grid( :column => 5, :row => 2, :sticky => 'w')
# create the button with value 3
Tk::Tile::Button.new(content) {text '3'; command {add1digit('3')}}.grid( :column => 6, :row => 2, :sticky => 'w')
# create the button with value %
Tk::Tile::Button.new(content) {text '%'; command {setaction('%')}}.grid( :column => 7, :row => 2, :sticky => 'w')

# create the button with value 4
Tk::Tile::Button.new(content) {text '4'; command {add1digit('4')}}.grid( :column => 4, :row => 3, :sticky => 'w')
# create the button with value 5
Tk::Tile::Button.new(content) {text '5'; command {add1digit('5')}}.grid( :column => 5, :row => 3, :sticky => 'w')
# create the button with value 6
Tk::Tile::Button.new(content) {text '6'; command {add1digit('6')}}.grid( :column => 6, :row => 3, :sticky => 'w')
# create the button with value -
Tk::Tile::Button.new(content) {text 'x'; command {setaction('x')}}.grid( :column => 7, :row => 3, :sticky => 'w')

# create the button with value 7
Tk::Tile::Button.new(content) {text '7'; command {add1digit('7')}}.grid( :column => 4, :row => 4, :sticky => 'w')
# create the button with value 8
Tk::Tile::Button.new(content) {text '8'; command {add1digit('8')}}.grid( :column => 5, :row => 4, :sticky => 'w')
# create the button with value 9
Tk::Tile::Button.new(content) {text '9'; command {add1digit('9')}}.grid( :column => 6, :row => 4, :sticky => 'w')
# create the button with value x
Tk::Tile::Button.new(content) {text '-'; command {setaction('-')}}.grid( :column => 7, :row => 4, :sticky => 'w')

# create the button with value 0
Tk::Tile::Button.new(content) {text '0'; command {add1digit('0')}}.grid( :column => 4, :row => 5, :sticky => 'w')
# create the button with value ,
Tk::Tile::Button.new(content) {text ','; command {add1digit('.')}}.grid( :column => 5, :row => 5, :sticky => 'w')
# create the button with value =
Tk::Tile::Button.new(content) {text '='; command {setaction('=')}}.grid( :column => 6, :row => 5, :sticky => 'w')
# create the button with value +
Tk::Tile::Button.new(content) {text '+'; command {setaction('+')}}.grid( :column => 7, :row => 5, :sticky => 'w')

# create the button with value c
Tk::Tile::Button.new(content) {text 'c'; command {setaction('c')}}.grid( :column => 4, :row => 6, :sticky => 'w')

TkWinfo.children(content).each {|w| TkGrid.configure w, :padx => 5, :pady => 5}
tl_overview.focus
enteramountscreen.bind("Return") {calcresult}


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
     
     puts 'current value change to ' + $svcalc.to_s 
     $currvalue.value = $svcalc
        
     $prevvalue.value = $currvalue
     puts '2 prev value change to ' + $prevvalue.to_s     
  rescue
     puts 'calculate result error <' + $svcalc.to_s + '>'
     #$tl_overview.value = 'rescue 1'
  end
end

def add1digit(digit)
  begin
     puts 'add1digit <' + digit +'>'
     # if the comma-value has been entered at least once
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
       $currvalue.value = $svcalc
       
       puts 'svcalc value value ' + $svcalc.to_s 
     end   
  rescue
     puts 'add 1 digit error'
     puts 'prevvalue ' + $prevvalue.to_s 
     puts 'currvalue ' + $currvalue.to_s 
     puts 'commaset ' +$commaset.to_s 
     puts 'svcalc ' + $svcalc.to_s 
  end
end

def manageconsumption(price, action)
  begin 
      add1digit(price)
      setaction(action)
  end
end


def delete1digit
  begin
     puts 'delete 1 digit'
     #$tl_overview.value = 'Stefano'
  rescue
     puts 'delete 1 digit error'
     #$tl_overview.value = 'rescue 3'
  end
end

def setaction(action)
  begin 
     puts 'setaction <' + action + '>'
     $actoperf = case action
     when 'c'
       resetcalc
     when '='
       calcresult
     when '+'
       calcresult
       $actoperf = 'add'
     when '-'
       calcresult
       $actoperf = 'subtract'
     when 'x'
       calcresult
       $actoperf = 'multiply'
     when '%' 
       calcresult
       $actoperf = 'divide'
     when '='
       calcresult
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


Tk.mainloop
