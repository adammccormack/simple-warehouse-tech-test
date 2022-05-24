# frozen_string_literal: true

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

  def store(x, y, w, h, p)
    h -= 1
    y -= 1
    x -= 1
    w -= 1
    h = y - h
    raise_store_error(x, y, w, h)
    store_product_at_location(x,y,w,h,p)
  end

  def remove(x, y, w, h)
    h -= 1
    y -= 1
    x -= 1
    w -= 1
    h = y - h
    raise_remove_error(x, y, w, h)
    remove_product_at_location(x, y, w, h)
  end

  def locate(p)
    @warehouse.each_with_index do |y, i|
      y.each_with_index do |val, idx|
        p "#{i}: #{idx}: #{val}" if val == p
      end
    end
  end

  def view
    @warehouse
  end

  def quit
    exit
  end


  private
  


  def to_empty_shelve_array
    to_empty_shelve_array = to_numbers_array.map { |_i| i = ' ' }
  end

  def set_warehouse_size
    @warehouse_size = @current_x * @current_y
  end

  def to_numbers_array
    to_numbers_array = (1..@warehouse_size).map { |i| i }
  end

  def to_grid
    to_grid = to_empty_shelve_array.each_slice(@current_x).to_a
    @warehouse = to_grid
  end

  def raise_store_error(x, y, w, h)
    message = "Sorry can't put that there : ("
    raise message if y.negative? || y > @warehouse.length
    raise message if h.negative? || h > @warehouse.length
    raise message if x.negative? || x > @warehouse[y].length
    raise message if w > @warehouse[y][x..].length
  end
  
  def store_product_at_location(x,y,w,h,p)
    @warehouse[y][x..(x + w)] = @warehouse[y][x..(x + w)].map { |_i| i = p }
    while y > h
      @warehouse[y - 1][x..(x + w)] = @warehouse[y - 1][x..(x + w)].map { |_i| i = p }
      y -= 1
    end
  end

  def raise_remove_error
    raise 'sorry nothing there : (' if x || y == ' '
  end

  def remove_product_at_location(x, y, w, h)
    @warehouse[y][x..(x + w)] = @warehouse[y][x..(x + w)].map { |_i| i = ' ' }
    while y > h
      @warehouse[y - 1][x..(x + w)] = @warehouse[y - 1][x..(x + w)].map { |_i| i = ' ' }
      y -= 1
    end
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
