class Cell
  attr_reader :row_index, :column_index
  attr_accessor :is_ship, :status

  def initialize(row_index, column_index)
    @row_index = row_index
    @column_index = column_index
    @is_ship = false
  end
  
  def is_ship?
    @is_ship
  end
end