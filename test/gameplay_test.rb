require 'minitest/autorun'
require './lib/gameplay_helper'
include GamePlay

class TestGamePlay < Minitest::Test
  def test_display_grid
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid_with_computer_ships = ShipPlacement::place_computer_ships(grid)
    assert_output(/false/) { 
      GamePlay::display_grid(grid_with_computer_ships)
    }
  end

  def test_display_grid_headers
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid_with_computer_ships = ShipPlacement::place_computer_ships(grid)
    assert_output(/A/) { 
      GamePlay::display_grid(grid_with_computer_ships)
    }
  end
end