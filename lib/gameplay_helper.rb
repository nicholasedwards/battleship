require './lib/grid'
require './lib/ship_placement_helper'
require './lib/player'
require './lib/formatting_helper'
include ShipPlacement
include Formatting
require 'pry'

module GamePlay
  def create_computer_grid
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    computer_grid = ShipPlacement.place_computer_ships(grid)
    puts "I have laid out my ships on the grid.\nYou now need to layout your two ships.\nThe first is two units long and the\nsecond is three units long.\nThe grid has A1 at the top left and D4 at the bottom right.\n\nEnter the squares for the two-unit ship:"
    computer_grid
  end

  def get_player_grid
    empty_grid = Grid.new
    grid = empty_grid.populate_grid
    player_grid = ShipPlacement.place_player_ships(grid)
    player_grid
  end

  def play_game
    player = Player.new
    computer_grid = GamePlay.create_computer_grid
    player_grid = GamePlay.get_player_grid
    display_grids(computer_grid, player_grid)
    game_complete = false
    until game_complete
      puts "It is your turn to fire. Please enter a position to fire on:"
      player_target = gets.chomp
      # validate player_target
      computer_grid = player.fire(player_target, computer_grid)
      row_index, column_index = format_position(player_target)
      if computer_grid[row_index][column_index].status == "H"
        puts "You hit an enemy ship!"
      else
        puts "You missed."
      end
      display_grids(computer_grid, player_grid)
      turn_complete = ""
      until turn_complete.include?("\n")
        puts "Please press ENTER to end your turn."
        turn_complete = gets
      end
      game_complete = true
    end
  end
  
  def display_grids(grid1, grid2)
    puts "  1  2  3  4"
    4.times do |row_index|
      row_letter = { 0 => "A", 1 => "B", 2 => "C", 3 => "D"}[row_index]
      print row_letter
      print " "
      4.times do |column_index|
        if grid1[row_index][column_index].status == "H" || grid1[row_index][column_index].status == "M"
          print grid1[row_index][column_index].status
        else
          print " "
        end
        print "  "
      end
      puts ""
    end

    puts "============="

    puts "  1  2  3  4"
    4.times do |row_index|
      row_letter = { 0 => "A", 1 => "B", 2 => "C", 3 => "D"}[row_index]
      print row_letter
      print " "
      4.times do |column_index|
        if grid1[row_index][column_index].status == "H" || grid1[row_index][column_index].status == "M"
          print grid2[row_index][column_index].status
        else
          print " "
        end
        print "  "
      end
      puts ""
    end
  end
end