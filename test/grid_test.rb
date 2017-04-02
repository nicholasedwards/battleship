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

  def test_grid_can_add_small_ships
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid.place_small_ship("A1", "A2")
    assert_equal true, grid[0][0].is_ship?
    assert_equal true, grid[0][1].is_ship?
    assert_equal false, grid[1][0].is_ship?
    assert_equal false, grid[1][1].is_ship?
    assert_equal false, grid[0][2].is_ship?

    another_empty_grid = Grid.new
    another_grid = empty_grid.populate_grid
    another_grid.place_small_ship("A1", "B1")
    assert_equal true, another_grid[0][0].is_ship?
    assert_equal true, another_grid[1][0].is_ship?
    assert_equal false, another_grid[0][1].is_ship?
    assert_equal false, another_grid[1][1].is_ship?
    assert_equal false, another_grid[2][0].is_ship?
  end

  def test_grid_can_add_large_ships
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid.place_large_ship("A1", "A3")
    assert_equal true, grid[0][0].is_ship?
    assert_equal true, grid[0][1].is_ship?
    assert_equal true, grid[0][2].is_ship?
    assert_equal false, grid[1][0].is_ship?
    assert_equal false, grid[0][3].is_ship?

    another_empty_grid = Grid.new
    another_grid = empty_grid.populate_grid
    another_grid.place_large_ship("A1", "C1")
    assert_equal true, another_grid[0][0].is_ship?
    assert_equal true, another_grid[1][0].is_ship?
    assert_equal true, another_grid[2][0].is_ship?
    assert_equal false, another_grid[0][1].is_ship?
    assert_equal false, another_grid[3][0].is_ship?
  end
end