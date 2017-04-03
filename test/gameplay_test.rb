require 'minitest/autorun'
require './lib/gameplay_helper'
include GamePlay

class TestGamePlay < Minitest::Test
  def test_display_grid
    assert_output(/false/) { 
      GamePlay::display_grid
    }
  end

  def test_display_grid_headers
    assert_output(/A/) { 
      GamePlay::display_grid
    }
  end
end