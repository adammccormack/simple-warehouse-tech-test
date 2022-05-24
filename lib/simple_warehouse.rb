# frozen_string_literal: true

require_relative 'storage'

class SimpleWarehouse
  attr_reader :current_x, :current_y
  attr_accessor :warehouse

  def initialize(storage = Storage.new)
    @current_x = 0
    @current_y = 0
    @warehouse = []
    @storage = storage
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

  def init(w, h)
    x = w
    y = h
    @current_x = x
    @current_y = y
    set_warehouse_size
    to_numbers_array
    to_empty_shelf_array
    to_grid
  end

  def store(x, y, w, h, p)
    warehouse = @warehouse
    @storage.store_product_at_location(warehouse, x, y, w, h, p)
  end

  def remove(x, y, w, h)
    warehouse = @warehouse
    @storage.remove_product_at_location(warehouse, x, y, w, h)
  end

  def locate(p)
    find(p)
  end

  def view
    @warehouse
  end

  def quit
    exit
  end

  private

  def find(p)
    @warehouse.each_with_index do |y, i|
      y.each_with_index do |val, idx|
        p "#{i}: #{idx}: #{val}" if val == p
      end
    end
  end

  def to_empty_shelf_array
    to_empty_shelf_array = to_numbers_array.map { |_i| i = ' ' }
  end

  def set_warehouse_size
    @warehouse_size = @current_x * @current_y
  end

  def to_numbers_array
    to_numbers_array = (1..@warehouse_size).map { |i| i }
  end

  def to_grid
    to_grid = to_empty_shelf_array.each_slice(@current_x).to_a
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
