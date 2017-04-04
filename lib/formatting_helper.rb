module Formatting
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

  def convert_formatted_cell_to_indices(start_cell, end_cell)
    start_row_letter = start_cell.split("")[0]
    start_row_index = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}[start_row_letter]
    start_column = start_cell.split("")[1]
    start_column_index = start_column.to_i - 1

    end_row_letter = end_cell.split("")[0]
    end_row_index = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}[end_row_letter]
    end_column = end_cell.split("")[1]
    end_column_index = end_column.to_i - 1
    [start_row_index, end_row_index, start_column_index, end_column_index]
  end

  def set_formatted_end_cell(end_row_index, end_column_index)
    end_row_letter = {0 => "A", 1 => "B", 2 => "C", 3 => "D"}[end_row_index]
    end_column = end_column_index + 1
    end_cell = [end_row_letter, end_column].join
    end_cell
  end
end