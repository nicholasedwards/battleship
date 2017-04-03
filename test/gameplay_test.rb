require 'minitest/autorun'
require './lib/gameplay_helper'
include GamePlay

class TestGamePlay < Minitest::Test
  def test_display_grid
    assert_output(/false/) { 
      GamePlay::display_grid
    }
  end
end