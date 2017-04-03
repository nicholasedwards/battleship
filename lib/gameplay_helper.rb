require './lib/grid'
require './lib/ship_placement_helper'
include ShipPlacement
require 'pry'

module GamePlay
  def display_grid
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid_with_computer_ships = ShipPlacement::place_computer_ships(grid)
    4.times do |row_index|
      4.times do |column_index|
        print ( grid_with_computer_ships[row_index][column_index].is_ship? == true )
        print " "
      end
      puts ""
    end
  end
end