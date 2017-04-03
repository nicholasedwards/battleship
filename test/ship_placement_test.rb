require 'minitest/autorun'
require './lib/grid'
require './lib/ship_placement_helper'
include ShipPlacement

class TestShipPlacement < Minitest::Test

  def test_computer_places_ships
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid_with_computer_ships = ShipPlacement::place_computer_ships(grid)
    ship_cells = 0
    grid_with_computer_ships.each do |row|
      row.each do |cell|
        ship_cells += 1 if cell.is_ship? == true
      end
    end
    
    assert_equal 5, ship_cells
  end

end