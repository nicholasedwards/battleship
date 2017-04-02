class Cell
  attr_reader :row_index, :column_index

  def initialize(row_index, column_index)
    @row_index = row_index
    @column_index = column_index
  end
end