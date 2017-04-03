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

  def test_output_message_after_computer_sets_ships
    assert_output("I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:\n") {
      GamePlay::create_computer_grid
    }
  end

end