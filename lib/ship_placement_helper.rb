require './lib/formatting_helper'
require './lib/ship_placement_validation'
include Formatting
include ShipPlacementValidation

module ShipPlacement
  def place_computer_ships(grid)
    grid_with_small_ship = place_computer_small_ship(grid)
    grid_with_both_ships = place_computer_large_ship(grid_with_small_ship)
    grid_with_both_ships
  end

  def place_player_ships(grid)
    grid_with_small_ship = place_player_small_ship(grid)
    puts "Enter the squares for the three-unit ship:\n"
    grid_with_both_ships = place_player_large_ship(grid_with_small_ship)
    grid_with_both_ships
  end

  def place_computer_small_ship(grid)
    ship_placed = false
    until ship_placed
      start_row_index, start_column_index, start_cell = generate_start_position
      end_row_index, end_column_index, end_cell = generate_small_ship_end_position(start_row_index, start_column_index)
      if !grid[end_row_index].nil? && !grid[end_row_index][end_column_index].nil?
        grid = grid.place_small_ship(start_cell, end_cell, :computer)
        ship_placed = true if grid[end_row_index][end_column_index].is_ship? == true
      end
    end
    grid
  end

  def place_computer_large_ship(grid)
    ship_placed = false
    until ship_placed
      start_row_index, start_column_index, start_cell = generate_start_position
      end_row_index, end_column_index, end_cell = generate_large_ship_end_position(start_row_index, start_column_index)
      if !grid[end_row_index].nil? && !grid[end_row_index][end_column_index].nil?
        grid = grid.place_large_ship(start_cell, end_cell, :computer)
        if grid[end_row_index][end_column_index].is_ship? == true && grid[start_row_index][start_column_index].is_ship? == true
          ship_placed = true 
        end
      end
    end
    grid
  end

  def place_player_small_ship(grid)
    ship_placed = false
    until ship_placed
      start_cell = gets.chomp
      start_cell = validate_input(start_cell)
      end_cell = gets.chomp
      end_cell = validate_input(end_cell)
      start_row_index, start_column_index = Formatting.format_position(start_cell)
      end_row_index, end_column_index = Formatting.format_position(end_cell)
      if !grid[end_row_index].nil? && !grid[end_row_index][end_column_index].nil?
        grid = grid.place_small_ship(start_cell, end_cell, :player)
        if grid[end_row_index][end_column_index].is_ship? == true && grid[start_row_index][start_column_index].is_ship? == true
        ship_placed = true
        end
      end
    end
    grid
  end

  def place_player_large_ship(grid)
    ship_placed = false
    until ship_placed
      start_cell = gets.chomp
      start_cell = validate_input(start_cell)
      end_cell = gets.chomp
      end_cell = validate_input(end_cell)
      start_row_index, start_column_index = Formatting.format_position(start_cell)
      end_row_index, end_column_index = Formatting.format_position(end_cell)
      if !grid[end_row_index].nil? && !grid[end_row_index][end_column_index].nil?
        grid = grid.place_large_ship(start_cell, end_cell, :player)
        if grid[end_row_index][end_column_index].is_ship? == true && grid[start_row_index][start_column_index].is_ship? == true
          ship_placed = true
        end
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

  def generate_large_ship_end_position(start_row_index, start_column_index)
    direction = [:above, :right, :below, :left].sample
    if direction == :above
      end_row_index, end_column_index = set_large_ship_end_above(start_row_index, start_column_index)
    elsif direction == :right
      end_row_index, end_column_index = set_large_ship_end_right(start_row_index, start_column_index)
    elsif direction == :below
      end_row_index, end_column_index = set_large_ship_end_below(start_row_index, start_column_index)
    elsif direction == :left
      end_row_index, end_column_index = set_large_ship_end_left(start_row_index, start_column_index)
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

  def set_large_ship_end_above(start_row_index, start_column_index)
    end_column_index = start_column_index
    if start_row_index == 0 || start_row_index == 1
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_row_index = start_row_index + 2
    else
      end_row_index = start_row_index - 2
    end
    [end_row_index, end_column_index]
  end

  def set_large_ship_end_right(start_row_index, start_column_index)
    end_row_index = start_row_index
    if start_column_index == 3 || start_column_index == 2
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_column_index = start_column_index - 2
    else
      end_column_index = start_column_index + 2
    end
    [end_row_index, end_column_index]
  end

  def set_large_ship_end_below(start_row_index, start_column_index)
    end_column_index = start_column_index
    if start_row_index == 3 || start_row_index == 2
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_row_index = start_row_index - 2
    else
      end_row_index = start_row_index + 2
    end
    [end_row_index, end_column_index]
  end

  def set_large_ship_end_left(start_row_index, start_column_index)
    end_row_index = start_row_index
    if start_column_index == 0 || start_column_index == 1
      # at the edge of the grid. switch direction so as not to go off the grid.
      end_column_index = start_column_index + 2
    else
      end_column_index = start_column_index - 2
    end
   [end_row_index, end_column_index]
  end
end

class Array
# Methods that directly interact with the grid

  def place_small_ship(start_position, end_position, user)
    start_row_index, start_column_index = Formatting.format_position(start_position)
    end_row_index, end_column_index = Formatting.format_position(end_position)
    if Formatting.validate_small_ship(start_row_index, start_column_index, end_row_index, end_column_index, user) == true && no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index, user) == true
      set_ends_of_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    end
    self
  end

  def place_large_ship(start_position, end_position, user)
    start_row_index, start_column_index = Formatting.format_position(start_position)
    end_row_index, end_column_index = Formatting.format_position(end_position)
    if Formatting.validate_large_ship(start_row_index, start_column_index, end_row_index, end_column_index, user) == true && no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index, user) == true
      set_ends_of_ship(start_row_index, start_column_index, end_row_index, end_column_index)
      set_middle_of_large_ship(start_row_index, start_column_index, end_row_index, end_column_index)
    end
    self
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