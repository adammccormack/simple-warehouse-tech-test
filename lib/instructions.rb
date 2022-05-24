# frozen_string_literal: true

class Instructions
  def show_help_message
    help_message
  end

  def show_unrecognized_message
    unrecognized_message
  end

  private

  def help_message
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

  def unrecognized_message
    puts 'Command not found. Type `help` for instructions on usage'
  end
end
