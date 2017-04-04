require 'pry'

module GridHelper
# Methods that do not directly interact with the grid
    def format_position(input_position)
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
end

class Array
# Methods that directly interact with the grid
include GridHelper

  def place_small_ship(start_position, end_position, user)
    start_row_index, start_column_index = GridHelper::format_position(start_position)
    end_row_index, end_column_index = GridHelper::format_position(end_position)
    if GridHelper::validate_small_ship(start_row_index, start_column_index, end_row_index, end_column_index, user) == true && no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index, user) == true
      set_ends_of_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    end
  end

  def place_large_ship(start_position, end_position, user)
    start_row_index, start_column_index = GridHelper::format_position(start_position)
    end_row_index, end_column_index = GridHelper::format_position(end_position)
    if GridHelper::validate_large_ship(start_row_index, start_column_index, end_row_index, end_column_index, user) == true && no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index, user) == true
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
end