require './lib/grid'
require './lib/ship_placement_helper'
include ShipPlacement
require 'pry'

module GamePlay
  def create_computer_grid
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid_with_computer_ships = ShipPlacement::place_computer_ships(grid)
    puts "You now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
    grid_with_computer_ships
  end
  
  def display_grid(grid)
    puts "  1  2  3  4"
    4.times do |row_index|
      row_letter = { 0 => "A", 1 => "B", 2 => "C", 3 => "D"}[row_index]
      print row_letter
      4.times do |column_index|
        print " "
        print ( grid[row_index][column_index].is_ship? == true )
        print " "
      end
      puts ""
    end
  end
end