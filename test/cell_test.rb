require 'minitest/autorun'
require './lib/cell'

class TestCell < Minitest::Test
  def test_cell_has_a_position
    new_cell = Cell.new(0,1)
    assert_equal 0, new_cell.row_index
    assert_equal 1, new_cell.column_index
  end

  def test_cell_is_either_a_ship_or_not
    new_cell = Cell.new(0,1)
    assert_respond_to(new_cell, :is_ship?)
  end

  def test_cell_has_a_status
    new_cell = Cell.new(0,1)
    assert_respond_to(new_cell, :status)
  end
end