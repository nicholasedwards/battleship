require 'minitest/autorun'
require './lib/gameplay_helper'
include GamePlay

class TestGamePlay < Minitest::Test
  def test_display_grid
    grid_with_computer_ships = GamePlay::create_computer_grid
    assert_output(/false/) { 
      GamePlay::display_grid(grid_with_computer_ships)
    }
  end

  def test_display_grid_headers
    grid_with_computer_ships = GamePlay::create_computer_grid
    assert_output(/A/) { 
      GamePlay::display_grid(grid_with_computer_ships)
    }
  end
end