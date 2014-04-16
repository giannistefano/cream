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


# create the calculator inputfield 
tl_calc = Tk::Tile::Entry.new(content) {width 7; textvariable $currvalue}.grid( :columnspan => 3, :row => 0, :sticky => 'we')

# create the button with value backspace
Tk::Tile::Button.new(content) {text '<-'; command {delete1digit}}.grid( :column => 3, :row => 0, :sticky => 'w')

# create the button with value 1
Tk::Tile::Button.new(content) {text '1'; command {add1digit('1')}}.grid( :column => 0, :row => 1, :sticky => 'w')
# create the button with value 2
Tk::Tile::Button.new(content) {text '2'; command {add1digit('2')}}.grid( :column => 1, :row => 1, :sticky => 'w')
# create the button with value 3
Tk::Tile::Button.new(content) {text '3'; command {add1digit('3')}}.grid( :column => 2, :row => 1, :sticky => 'w')
# create the button with value %
Tk::Tile::Button.new(content) {text '%'; command {setaction('%')}}.grid( :column => 3, :row => 1, :sticky => 'w')

# create the button with value 4
Tk::Tile::Button.new(content) {text '4'; command {add1digit('4')}}.grid( :column => 0, :row => 2, :sticky => 'w')
# create the button with value 5
Tk::Tile::Button.new(content) {text '5'; command {add1digit('5')}}.grid( :column => 1, :row => 2, :sticky => 'w')
# create the button with value 6
Tk::Tile::Button.new(content) {text '6'; command {add1digit('6')}}.grid( :column => 2, :row => 2, :sticky => 'w')
# create the button with value -
Tk::Tile::Button.new(content) {text 'x'; command {setaction('x')}}.grid( :column => 3, :row => 2, :sticky => 'w')

# create the button with value 7
Tk::Tile::Button.new(content) {text '7'; command {add1digit('7')}}.grid( :column => 0, :row => 3, :sticky => 'w')
# create the button with value 8
Tk::Tile::Button.new(content) {text '8'; command {add1digit('8')}}.grid( :column => 1, :row => 3, :sticky => 'w')
# create the button with value 9
Tk::Tile::Button.new(content) {text '9'; command {add1digit('9')}}.grid( :column => 2, :row => 3, :sticky => 'w')
# create the button with value x
Tk::Tile::Button.new(content) {text '-'; command {setaction('-')}}.grid( :column => 3, :row => 3, :sticky => 'w')

# create the button with value 0
Tk::Tile::Button.new(content) {text '0'; command {add1digit('0')}}.grid( :column => 0, :row => 4, :sticky => 'w')
# create the button with value ,
Tk::Tile::Button.new(content) {text ','; command {add1digit(',')}}.grid( :column => 1, :row => 4, :sticky => 'w')
# create the button with value =
Tk::Tile::Button.new(content) {text '='; command {calcresult}}.grid( :column => 2, :row => 4, :sticky => 'w')
# create the button with value +
Tk::Tile::Button.new(content) {text '+'; command {setaction('+')}}.grid( :column => 3, :row => 4, :sticky => 'w')

TkWinfo.children(content).each {|w| TkGrid.configure w, :padx => 5, :pady => 5}
tl_calc.focus
enteramountscreen.bind("Return") {calcresult}

def calcresult
  begin
     # add a comment
     puts 'calculate result'
     puts '1'
     #$currvalue.value = 0
     $currvaluereset = 'y'
     puts '2' 
     $svcalc = 0
     puts '3'
     $commaset = ' '
     puts '4'
     #$tl_calc.value = 'result'
     puts 'previous value <' + $prevvalue + '>'
     if $prevvalue == 0
        puts 'previous value is 0'
        $prevvalue = $svcalc
     else     
        if $actoperf == 'add' 
           puts 'adding'       
           #$svcalc.to_f = $prevvalue.to_f + $currvalue.to_f
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
     end       
  rescue
     puts 'calculate result error <' + $svcalc +'>'
     #$tl_calc.value = 'rescue 1'
  end
end

def add1digit(digit)
  begin
     puts 'add1digit <' + digit +'>'
     # if the comma-value has been entered at least once
     if (digit == ',' and $commaset == '1')
         puts 'can not enter more than 1 comma'  
     else
       if digit == ','
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
       puts $svcalc 
     end   
  rescue
     puts 'add 1 digit error'
     puts 'prevvalue ' + $prevvalue
     puts 'currvalue ' + $currvalue
     puts 'commaset ' +$commaset
     puts 'svcalc ' + $svcalc
  end
end

def delete1digit
  begin
     puts 'delete 1 digit'
     #$tl_calc.value = 'Stefano'
  rescue
     puts 'delete 1 digit error'
     #$tl_calc.value = 'rescue 3'
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
     #$tl_calc.value = 'result'
     calcresult
#  rescue
#     puts 'set action error'
     #$tl_calc.value = 'rescue 1'
  end
end


Tk.mainloop
