class Array
  def place_small_ship(start_position, end_position)
    start_row_letter = start_position.split("")[0]
    start_row_index = 0 if start_row_letter == "A"
    start_row_index = 1 if start_row_letter == "B"
    start_row_index = 2 if start_row_letter == "C"
    start_row_index = 3 if start_row_letter == "D"

    start_column_number = start_position.split("")[1]
    start_column_index = 0 if start_column_number == "1"
    start_column_index = 1 if start_column_number == "2"
    start_column_index = 2 if start_column_number == "3"
    start_column_index = 3 if start_column_number == "4"

    end_row_letter = end_position.split("")[0]
    end_row_index = 0 if end_row_letter == "A"
    end_row_index = 1 if end_row_letter == "B"
    end_row_index = 2 if end_row_letter == "C"
    end_row_index = 3 if end_row_letter == "D"

    end_column_number = end_position.split("")[1]
    end_column_index = 0 if end_column_number == "1"
    end_column_index = 1 if end_column_number == "2"
    end_column_index = 2 if end_column_number == "3"
    end_column_index = 3 if end_column_number == "4"

    self[start_row_index][start_column_index].is_ship = true
    self[end_row_index][end_column_index].is_ship = true
  end
end
