require 'minitest/autorun'
require './lib/cell'
require './lib/ai'

class TestAI < Minitest::Test
  def test_player_can_shoot
    empty_player_grid = Grid.new
    player_grid = empty_ai_grid.populate_grid
    player_grid[0][0].is_ship = true
    player_grid[0][1].is_ship = false
    ai = AI.new
    ai.fire("A1", ai_grid)
    ai.fire("A2", ai_grid)
    assert_equal "H", player_grid[0][0].status
    assert_equal "M", player_grid[0][1].status
  end
end