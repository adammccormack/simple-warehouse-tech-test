class SimpleWarehouse
  attr_reader :current_x, :current_y
  attr_accessor :warehouse

  def initialize
    @current_x = 0
    @current_y = 0
    @warehouse = []
  end

  def run
    @live = true
    puts 'Type `help` for instructions on usage'
    while @live
      print '> '
      command = gets.chomp
      case command
        when 'help'
          show_help_message
        when 'exit'
          exit
        else
          show_unrecognized_message
      end
    end
  end

  def init(x, y)
    @current_x = x
    @current_y = y
    set_warehouse_size
    to_numbers_array
    to_empty_shelve_array
    to_grid
  end

  def decrement_y(y, h)
    h = y-h
    until y == h|| y == 0
      puts y
      y -= 1
    end
    y
  end

  def store(y, x, w, h)
      h = y-h
      @warehouse[y][x..(x+w)] = @warehouse[y][x..(x+w)].map {|i| i = 'Q' }
      while y >= h
        @warehouse[y-1][x..(x+w)] = @warehouse[y-1][x..(x+w)].map {|i| i = 'Q' }
        y -= 1
      end
  end


  # how to replace the existing grid with the specific indexes you want with .map

  # a[1][2..11] = a[1][2..11].map {|i| i = 'F' }

  # and it works!

  # fills space with square 3x4 dimensions

    # w.warehouse[3][2..(2+4)] = w.warehouse[3][2..(2+4)].map {|i| i = 'Q' }
    # w.warehouse[4][2..(2+4)] = w.warehouse[4][2..(2+4)].map {|i| i = 'Q' }
    # w.warehouse[5][2..(2+4)] = w.warehouse[5][2..(2+4)].map {|i| i = 'Q' }


    # do this once, then on the next loop do it again with 5-1 instead, and so on
    
    # w.warehouse[5][2..(2+4)] = w.warehouse[5][2..(2+4)].map {|i| i = 'Q' }

    

  def store(x, y, w, h, p)
    position_x = x-1
    position_y = y-1
    starting_position = @warehouse[position_y][position_x]
    crate_size = w*h
    product_type = p
  end


  def experiment
    init(12,8)
    store(6,2,3,4,'P')
  end

  def view
    true
  end

  private

  def to_empty_shelve_array
    to_empty_shelve_array = to_numbers_array.map {|i| i = ' '}
  end

  def set_warehouse_size
    @warehouse_size = @current_x*@current_y
  end

  def to_numbers_array
    to_numbers_array = (1..@warehouse_size).map {|i| i}
  end

  def to_grid
    to_grid = to_empty_shelve_array.each_slice(@current_x).to_a
    @warehouse = to_grid
  end

  def show_help_message
    puts <<~HELP
      help             Shows this help message
      init W H         (Re)Initialises the application as an empty W x H warehouse.
      store X Y W H P  Stores a crate of product code P and of size W x H at position (X,Y).
      locate P         Show a list of all locations occupied by product code P.
      remove X Y       Remove the entire crate occupying the location (X,Y).
      view             Output a visual representation of the current state of the grid.
      exit             Exits the application.
    HELP
  end

  def show_unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end

  def exit
    puts 'Thank you for using simple_warehouse!'
    @live = false
  end

end
