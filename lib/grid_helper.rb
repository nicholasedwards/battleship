module GridHelper
# Methods that do not directly interact with the grid

    def self.format_position(input_position)
    letters = input_position.split("")

    row_index = 0 if letters[0] == "A"
    row_index = 1 if letters[0] == "B"
    row_index = 2 if letters[0] == "C"
    row_index = 3 if letters[0] == "D"

    column_index = 0 if letters[1] == "1"
    column_index = 1 if letters[1] == "2"
    column_index = 2 if letters[1] == "3"
    column_index = 3 if letters[1] == "4"

    [row_index, column_index]
  end

  def self.validate_small_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    if ship_is_diagonal?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a ship diagonally! Your ship can only be horizontal or vertical. Please try again."
      return false
    elsif ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a small ship that is greater than two cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please try again."
      return false
    else
      return true
    end
  end

  def self.validate_large_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    if ship_is_diagonal?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a ship diagonally! Your ship can only be horizontal or vertical. Please try again."
      return false
    elsif ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a large ship that is greater than three cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please try again."
      return false
    else
      return true
    end
  end

  def self.ship_is_diagonal?(start_row_index, start_column_index, end_row_index, end_column_index)
    ( start_row_index != end_row_index ) && ( start_column_index != end_column_index )
  end

  def self.ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
    ( end_column_index - start_column_index ) > 2 || ( end_row_index - start_row_index ) > 2
  end

end

class Array
# Methods that directly interact with the grid

include GridHelper

  def place_small_ship(start_position, end_position)
    start_row_index, start_column_index = GridHelper::format_position(start_position)
    end_row_index, end_column_index = GridHelper::format_position(end_position)
    if GridHelper::validate_small_ship(start_row_index, start_column_index, end_row_index, end_column_index) == true && no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index) == true
      set_ends_of_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    end
  end

  def place_large_ship(start_position, end_position)
    start_row_index, start_column_index = GridHelper::format_position(start_position)
    end_row_index, end_column_index = GridHelper::format_position(end_position)
    if GridHelper::validate_large_ship(start_row_index, start_column_index, end_row_index, end_column_index) == true && no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index) == true
      set_ends_of_ship(start_row_index, start_column_index, end_row_index, end_column_index)
      set_middle_of_large_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    end
  end

  def set_middle_of_large_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    if start_row_index == end_row_index
      # The ship is horizontal
      middle_column_index = ( start_column_index + end_column_index ) / 2
      self[start_row_index][middle_column_index].is_ship = true
    else 
      # The ship is not horizontal
      middle_row_index = ( start_row_index + end_row_index ) / 2
      self[middle_row_index][start_column_index].is_ship = true
    end
  end

  def set_ends_of_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    self[start_row_index][start_column_index].is_ship = true
    self[end_row_index][end_column_index].is_ship = true
  end

  def no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index)
    if self[start_row_index][start_column_index].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again."
      return false
    elsif self[end_row_index][end_column_index].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again."
      return false
    elsif self[ ( start_row_index + end_row_index ) / 2 ][start_column_index].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again."
      return false
    elsif self[start_row_index][ ( start_column_index + end_column_index ) / 2 ].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again."
      return false
    else
      return true
    end
  end
end