require './lib/grid'
require './lib/ship_placement_helper'
require './lib/player'
require './lib/formatting_helper'
require './lib/input_validation'
require './lib/ai'
include ShipPlacement
include Formatting
include InputValidation
require 'pry'

module GamePlay

  def play_game
    player = Player.new
    ai = AI.new
    computer_grid = GamePlay.create_computer_grid
    player_grid = GamePlay.get_player_grid
    display_grids(computer_grid, player_grid)
    play_until_complete(player, ai, player_grid, computer_grid)
  end

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
  
  def display_grids(grid1, grid2)
    display_grid(grid1)
    puts "============="
    display_grid(grid2)
  end

  def display_grid(grid)
    puts "  1  2  3  4"
    4.times do |row_index|
      row_letter = get_row_letter(row_index)
      print row_letter
      print " "
      4.times do |column_index|
        if grid[row_index][column_index].status == "H" || grid[row_index][column_index].status == "M"
          print grid[row_index][column_index].status
        else
          print " "
        end
        print "  "
      end
      puts ""
    end
  end

  def end_player_turn
    turn_complete = ""
    until turn_complete.include?("\n")
      puts "Please press ENTER to end your turn."
      turn_complete = gets
    end
  end

  def play_until_complete(player, ai, player_grid, computer_grid)
    game_complete = false
    until game_complete
      computer_grid = get_player_shot(player, computer_grid)
      display_grids(computer_grid, player_grid)
      end_player_turn
      player_grid = make_ai_shot(ai, player_grid)
      display_grids(computer_grid, player_grid)
      # change this to only happen when all ship elements on a grid are hit
      game_complete = true
    end
  end

  def get_player_shot(player, computer_grid)
    puts "It is your turn to fire. Please enter a position to fire on:"
    player_target = gets.chomp
    player_target = validate_input(player_target, :target)
    computer_grid = player.fire(player_target, computer_grid)
    row_index, column_index = format_position(player_target)
    if computer_grid[row_index][column_index].status == "H"
      puts "You hit an enemy ship!"
    else
      puts "You missed."
    end
    computer_grid
  end

  def make_ai_shot(ai, player_grid)
    row_index, column_index, player_grid = ai.fire(player_grid)
    cell = format_cell(row_index, column_index)
    if player_grid[row_index][column_index].status == "H"
      puts "The AI fired at #{cell} and hit one of your ships!"
    else
      puts "The AI fired at #{cell} and missed."
    end
    player_grid
  end
end