require './lib/grid'
require './lib/ship_placement_helper'
include ShipPlacement
require 'pry'

module GamePlay
  def display_grid(grid)
    puts "  1  2  3  4"
    4.times do |row_index|
      row_letter = { 0 => "A", 1 => "B", 2 => "C", 3 => "D"}[row_index]
      print row_letter
      4.times do |column_index|
        print " "
        print ( grid[row_index][column_index].is_ship? == true )
        print " "
      end
      puts ""
    end
  end
end