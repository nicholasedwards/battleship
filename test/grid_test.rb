require 'minitest/autorun'
require './lib/grid'
require 'pry'

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
    grid.place_small_ship("A1", "A2", :player)
    assert_equal true, grid[0][0].is_ship?
    assert_equal true, grid[0][1].is_ship?
    assert_equal false, grid[1][0].is_ship?
    assert_equal false, grid[1][1].is_ship?
    assert_equal false, grid[0][2].is_ship?

    another_empty_grid = Grid.new
    another_grid = empty_grid.populate_grid
    another_grid.place_small_ship("A1", "B1", :player)
    assert_equal true, another_grid[0][0].is_ship?
    assert_equal true, another_grid[1][0].is_ship?
    assert_equal false, another_grid[0][1].is_ship?
    assert_equal false, another_grid[1][1].is_ship?
    assert_equal false, another_grid[2][0].is_ship?
  end

  def test_grid_can_add_large_ships
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    grid.place_large_ship("A1", "A3", :player)
    assert_equal true, grid[0][0].is_ship?
    assert_equal true, grid[0][1].is_ship?
    assert_equal true, grid[0][2].is_ship?
    assert_equal false, grid[1][0].is_ship?
    assert_equal false, grid[0][3].is_ship?

    another_empty_grid = Grid.new
    another_grid = empty_grid.populate_grid
    another_grid.place_large_ship("A1", "C1", :player)
    assert_equal true, another_grid[0][0].is_ship?
    assert_equal true, another_grid[1][0].is_ship?
    assert_equal true, another_grid[2][0].is_ship?
    assert_equal false, another_grid[0][1].is_ship?
    assert_equal false, another_grid[3][0].is_ship?
  end

  def test_small_ships_are_only_2_cells
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    assert_output("You tried placing a small ship that is greater than two cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please type the start cell again and press enter, followed by the same process for the end cell.\n") do
      grid.place_small_ship("A1", "A4", :player) 
    end
    assert_equal false, grid[0][0].is_ship?
    assert_equal false, grid[0][1].is_ship?

    another_empty_grid = Grid.new
    another_grid = another_empty_grid.populate_grid
    assert_output("You tried placing a small ship that is greater than two cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please type the start cell again and press enter, followed by the same process for the end cell.\n") do
      another_grid.place_small_ship("A1", "A4", :player)
    end
    assert_equal false, another_grid[0][0].is_ship?
    assert_equal false, another_grid[0][1].is_ship?
  end

  def test_large_ships_are_only_3_cells
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    assert_output("You tried placing a large ship that is greater than three cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please type the start cell again and press enter, followed by the same process for the end cell.\n") do
      grid.place_large_ship("A1", "A4", :player)
    end
    assert_equal false, grid[0][0].is_ship?
    assert_equal false, grid[0][3].is_ship?

    another_empty_grid = Grid.new
    another_grid = another_empty_grid.populate_grid
    assert_output("You tried placing a large ship that is greater than three cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please type the start cell again and press enter, followed by the same process for the end cell.\n") do
      grid.place_large_ship("A1", "D1", :player)
    end
    assert_equal false, grid[0][0].is_ship?
    assert_equal false, grid[3][0].is_ship?
  end

  def test_no_diagonal_ships
    empty_grid = Grid.new
    grid = empty_grid.populate_grid

    assert_output("You tried placing a ship diagonally! Your ship can only be horizontal or vertical. Please type the start cell again and press enter, followed by the same process for the end cell.\n") {
      grid.place_small_ship("A1", "B2", :player)
    }
    assert_equal false, grid[0][0].is_ship?
    assert_equal false, grid[1][1].is_ship?

    assert_output("You tried placing a ship diagonally! Your ship can only be horizontal or vertical. Please type the start cell again and press enter, followed by the same process for the end cell.\n") {
      grid.place_large_ship("A1", "D3", :player)
    }
    assert_equal false, grid[0][0].is_ship?
    assert_equal false, grid[3][2].is_ship?
  end

  def test_no_overlapping_ships
    empty_grid = Grid.new
    grid_1 = empty_grid.populate_grid
    grid_2 = empty_grid.populate_grid
    grid_3 = empty_grid.populate_grid
    grid_4 = empty_grid.populate_grid

    grid_1.place_small_ship("A1", "A2", :player)
    assert_output("You tried placing a ship that would overlap over another ship! Please type the start cell again and press enter, followed by the same process for the end cell.\n") {
      grid_1.place_small_ship("A2", "A3", :player)
    }
    assert_equal false, grid_1[0][2].is_ship?

    grid_2.place_large_ship("B1", "B3", :player)
    assert_output("You tried placing a ship that would overlap over another ship! Please type the start cell again and press enter, followed by the same process for the end cell.\n") {
      grid_2.place_large_ship("B2", "B4", :player)
    }
    assert_equal false, grid_2[1][3].is_ship?

    grid_3.place_large_ship("A1", "A3", :player)
    assert_output("You tried placing a ship that would overlap over another ship! Please type the start cell again and press enter, followed by the same process for the end cell.\n") {
      grid_3.place_small_ship("A2", "B2", :player)
    }
    assert_equal false, grid_3[1][1].is_ship?

    grid_4.place_large_ship("A2", "C2", :player)
    assert_output("You tried placing a ship that would overlap over another ship! Please type the start cell again and press enter, followed by the same process for the end cell.\n") {
      grid_4.place_large_ship("B1", "B3", :player)
    }
    assert_equal false, grid_4[1][0].is_ship?
  end

end