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

  # fills width with product
  # b.map.with_index { |val, idx| puts "#{idx} #{val}"
  #     if idx >= 2 && idx <= 6
  #         val = 'M'
  #     else
  #         val = val
  #     end
  #   }



  def store(x, y, w, h, p)
    position_x = x-1
    position_y = y-1
    starting_position = @warehouse[position_y][position_x]
    crate_size = w*h
    product_type = p
    # replace zero based indexes warehouse[1] y 1,2,3 with 'P'

    # example product P
    # example w h = (4, 3)
    # starting position is [6][2]
    # I want it to keep incrementing [x] until it has counted the length of w i.e in this example (4)

    # w = 4
    # h = 3

    # w.warehouse[6][2] = 'M'


    # w.warehouse[6][2] = 'M'
    # w.warehouse[6][3] = 'M'
    # w.warehouse[6][4] = 'M'
    # w.warehouse[6][5] = 'M'

    # w.warehouse[5][2] = 'M'
    # w.warehouse[5][3] = 'M'
    # w.warehouse[5][4] = 'M'
    # w.warehouse[5][5] = 'M'

    # w.warehouse[4][2] = 'M'
    # w.warehouse[4][3] = 'M'
    # w.warehouse[4][4] = 'M'
    # w.warehouse[4][5] = 'M'



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
    to_empty_shelve_array = to_numbers_array.map {|i| i = '  '}
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
