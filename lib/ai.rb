require './lib/formatting_helper'
include Formatting

class AI
  def fire(grid)
    fire_complete = false
    until fire_complete
      row_index = [0, 1, 2, 3].sample
      column_index = [0, 1, 2, 3].sample
      next if grid[row_index][column_index].status == "H" || grid[row_index][column_index].status == "M"
      if grid[row_index][column_index].is_ship? == true
        grid[row_index][column_index].status = "H"
      else
        grid[row_index][column_index].status = "M"
      end
      fire_complete = true
    end
    grid
  end
end