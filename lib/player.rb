require './lib/formatting_helper'
include Formatting
require 'pry'

class Player
  attr_reader :score
  def initialize
    @score = 0
  end

  def fire(target, grid)
    row_index, column_index = format_position(target)
    if grid[row_index][column_index].is_ship? == true
      @score += 1
      grid[row_index][column_index].status = "H"
    else
      grid[row_index][column_index].status = "M"
    end
    grid
  end
end