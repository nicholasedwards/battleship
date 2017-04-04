require 'minitest/autorun'
require './lib/cell'
require './lib/ai'

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
    player_grid = ai.fire(player_grid)

    hit_count = 0
    4.times do |row_index|
      4.times do |column_index|
        hit_count +=1 if player_grid[row_index][column_index].status = "H"
      end
    end
    
    assert hit_count > 1
  end
end