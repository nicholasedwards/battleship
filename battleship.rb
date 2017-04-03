require './lib/gameplay_helper'
include GamePlay

user_input_provided = false

until user_input_provided
  puts "Welcome to BATTLESHIP"
  puts ""
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  puts ">"

  action = gets.chomp
    if action == "p" || action == "play"
      user_input_provided = true
      computer_grid = GamePlay::create_computer_grid
      user_grid = GamePlay::get_user_grid
    elsif action == "i" || action == "instructions"
      instructions = File.open("./instructions/instructions.txt", "r")
      puts instructions.read
    elsif action == "q" || action == "quit"
      puts "Goodbye!"
      user_input_provided = true 
    end
end