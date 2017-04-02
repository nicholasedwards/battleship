require 'minitest/autorun'

class TestCell < Minitest::Test
  def test_cell_has_a_position
    new_cell = Cell.new(0,1)
    assert_equal 0, new_cell.row_index
    assert_equal 1, new_cell.column_index
  end
end