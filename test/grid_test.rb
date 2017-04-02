require 'minitest/autorun'
require './lib/grid'

class TestGrid < Minitest::Test
  def test_grid_has_4_rows_and_4_columns
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    refute_nil grid[0][0]
    refute_nil grid[3][3]
  end

  def test_grid_is_made_of_cells
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    assert_instance_of Cell, grid[0][0]
    assert_instance_of Cell, grid[3][3]
  end
end