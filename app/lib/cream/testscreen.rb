require 'tk'
require 'tkextlib/tile'
root = TkRoot.new
little = Tk::Tile::Label.new(root) {text 'Little'}.grid( :column => 0, :row => 0)
bigger = Tk::Tile::Label.new(root) {text 'Much Bigger Label'}.grid( :column => 0, :row => 0)
Tk.after 2000, proc{bigger.raise}
Tk.mainloop