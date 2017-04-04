require './lib/gameplay_helper'
include GamePlay

player_input_provided = false

until player_input_provided
  puts "Welcome to BATTLESHIP"
  puts ""
  puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
  puts ">"

  action = gets.chomp
    if action == "p" || action == "play"
      player_input_provided = true
      GamePlay.play_game
    elsif action == "i" || action == "instructions"
      instructions = File.open("./instructions/instructions.txt", "r")
      puts instructions.read
    elsif action == "q" || action == "quit"
      puts "Goodbye!"
      player_input_provided = true 
    end
end