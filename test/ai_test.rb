require 'minitest/autorun'
require './lib/cell'
require './lib/ai'
require './lib/grid'
require 'pry'

class TestAI < Minitest::Test
  def test_ai_can_shoot
    empty_player_grid = Grid.new
    player_grid = empty_player_grid.populate_grid

    4.times do |row_index|
      4.times do |column_index|
        player_grid[row_index][column_index].is_ship = true
      end
    end

    ai = AI.new
    row_index, column_index, player_grid = ai.fire(player_grid)
    
    assert_equal "H", player_grid[row_index][column_index].status
  end

  def test_ai_score
    empty_player_grid = Grid.new
    player_grid = empty_player_grid.populate_grid

    4.times do |row_index|
      4.times do |column_index|
        player_grid[row_index][column_index].is_ship = true
      end
    end

    ai = AI.new
    row_index, column_index, player_grid = ai.fire(player_grid)

    assert_equal 1, ai.score
  end
end