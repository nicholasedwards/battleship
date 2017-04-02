require './lib/cell'

class Grid
  def populate_grid
    grid = []
    4.times do |row_index|
    grid[row_index] = []
      4.times do |column_index|
        new_cell = Cell.new(row_index, column_index)
        grid[row_index] << new_cell
      end
    end
    grid
  end
end