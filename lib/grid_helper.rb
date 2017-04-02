module GridHelper
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
end

class Array
include GridHelper

  def place_small_ship(start_position, end_position)
    start_row_index, start_column_index = GridHelper::format_position(start_position)
    end_row_index, end_column_index = GridHelper::format_position(end_position)

    self[start_row_index][start_column_index].is_ship = true
    self[end_row_index][end_column_index].is_ship = true
  end

  def place_large_ship(start_position, end_position)
    start_row_index, start_column_index = GridHelper::format_position(start_position)
    end_row_index, end_column_index = GridHelper::format_position(end_position)

    # Set the ends of the ship
    self[start_row_index][start_column_index].is_ship = true
    self[end_row_index][end_column_index].is_ship = true

    # Set the middle of the ship
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

end