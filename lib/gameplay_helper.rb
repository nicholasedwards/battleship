require './lib/grid_helper'
require 'pry'

module GamePlay
  def place_computer_ships(grid)
    grid_with_small_ship = place_computer_small_ship(grid)
    grid_with_small_ship
  end

  def place_computer_small_ship(grid)
    ship_placed = false
    until ship_placed
      start_row_index, start_column_index, start_cell = generate_start_position
      end_row_index, end_column_index, end_cell = generate_small_ship_end_position(start_row_index, start_column_index)
      if !grid[end_row_index].nil? && !grid[end_row_index][end_column_index].nil?
        grid.place_small_ship(start_cell, end_cell)
        ship_placed = true if grid[end_row_index][end_column_index].is_ship? == true
      end
    end
    grid
  end

  def generate_start_position
    start_row_letter = ["A", "B", "C", "D"].sample
    start_row_index = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}[start_row_letter]
    start_column_index = [0, 1, 2, 3].sample
    start_column = start_column_index + 1
    start_cell = [start_row_letter, start_column].join
    [start_row_index, start_column_index, start_cell]
  end

  def generate_small_ship_end_position(start_row_index, start_column_index)
    direction = [:above, :right, :below, :left].sample
    if direction == :above
      end_row_index, end_column_index = set_small_ship_end_above(start_row_index, start_column_index)
    elsif direction == :right
      end_row_index, end_column_index = set_small_ship_end_right(start_row_index, start_column_index)
    elsif direction == :below
      end_row_index, end_column_index = set_small_ship_end_below(start_row_index, start_column_index)
    elsif direction == :left
      end_row_index, end_column_index = set_small_ship_end_left(start_row_index, start_column_index)
    end
    end_cell = set_formatted_end_cell(end_row_index, end_column_index)
    [end_row_index, end_column_index, end_cell]
  end

  def set_small_ship_end_above(start_row_index, start_column_index)
    end_column_index = start_column_index
    if start_row_index == 0
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_row_index = start_row_index + 1
    else
      end_row_index = start_row_index - 1
    end
    [end_row_index, end_column_index]
  end

  def set_small_ship_end_right(start_row_index, start_column_index)
    end_row_index = start_row_index
    if start_column_index == 3
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_column_index = start_column_index - 1
    else
      end_column_index = start_column_index + 1
    end
    [end_row_index, end_column_index]
  end

  def set_small_ship_end_below(start_row_index, start_column_index)
    end_column_index = start_column_index
    if start_row_index == 3
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_row_index = start_row_index - 1
    else
      end_row_index = start_row_index + 1
    end
    [end_row_index, end_column_index]
  end

  def set_small_ship_end_left(start_row_index, start_column_index)
    end_row_index = start_row_index
    if start_column_index == 0
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_column_index = start_column_index + 1
    else
      end_column_index = start_column_index - 1
    end
   [end_row_index, end_column_index]
  end

  def set_formatted_end_cell(end_row_index, end_column_index)
    end_row_letter = {0 => "A", 1 => "B", 2 => "C", 3 => "D"}[end_row_index]
    end_column = end_column_index + 1
    end_cell = [end_row_letter, end_column].join
    end_cell
  end

end
