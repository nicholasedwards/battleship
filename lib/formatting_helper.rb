module Formatting
  def format_position(input_position)
    letters = input_position.split("")
    first_character, last_character = letters[0], letters[1]
    row_index = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}[first_character]
    column_index = last_character.to_i - 1
    [row_index, column_index]
  end

  def convert_formatted_cell_to_indices(start_cell, end_cell)
    start_row_index, start_column_index = format_position(start_cell)
    end_row_index, end_column_index = format_position(end_cell)
    [start_row_index, end_row_index, start_column_index, end_column_index]
  end

  def set_formatted_end_cell(end_row_index, end_column_index)
    end_row_letter = {0 => "A", 1 => "B", 2 => "C", 3 => "D"}[end_row_index]
    end_column = end_column_index + 1
    end_cell = [end_row_letter, end_column].join
    end_cell
  end

  def get_row_letter(row_index)
    { 0 => "A", 1 => "B", 2 => "C", 3 => "D"}[row_index]
  end
end