require 'minitest/autorun'

class TestGrid < Minitest::Test
  def test_grid_has_4_rows_and_4_columns
    grid = Grid.new
    refute_nil grid[0][0]
    refute_nil grid[3][3]
  end

  def test_grid_is_made_of_cells
    grid = Grid.new
    assert_instance_of Cell, grid[0][0]
    assert_instance_of Cell, grid[3][3]
  end
end