require './lib/grid_helper'

module GamePlay
  def place_computer_ships(grid)

    ship_placed = false
    until ship_placed
      # try to place a small ship
      start_row_letter = ["A", "B", "C", "D"].sample
      start_row_index = {"A" => 0, "B" => 1, "C" => 2, "D" => 3}[start_row_letter]

      start_column_index = [0, 1, 2, 3].sample
      start_column = start_column_index + 1

      start_cell = [start_row_letter, start_column].join

      direction = [:above, :right, :below, :left].sample
      if direction == :above
        end_column_index = start_column_index
        end_row_index = start_row_index + 1
      elsif direction == :right
        end_column_index = start_column_index + 1
        end_row_index = start_row_index      
      elsif direction == :below
        end_column_index = start_column_index
        end_row_index = start_row_index - 1
      elsif direction == :left
        end_column_index = start_column_index - 1
        end_row_index = start_row_index
      end

      end_row_letter = {0 => "A", 1 => "B", 2 => "C", 3 => "D"}[end_row_index]
      end_column = end_column_index + 1

      end_cell = [end_row_letter, end_column].join

      if !grid[end_row_index].nil? && !grid[end_row_index][end_column_index].nil?
        grid.place_small_ship(start_cell, end_cell)
        ship_placed = true if grid[end_row_index][end_column_index].is_ship? == true
      end
    end
    grid
  end
end