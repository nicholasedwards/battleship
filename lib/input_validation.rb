require 'pry'
module InputValidation
  def validate_input(input, purpose)
    valid_input = false
    possible_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    if purpose == :start
      until valid_input
        if !possible_cells.include? input.upcase
          puts "Your ship's start coordinates do not represent a valid position on the grid. Please re-enter the squares for the ship."
          input = gets.chomp
        else
          valid_input = true
        end
      end
    elsif purpose == :end
      until valid_input
        if !possible_cells.include? input.upcase
          puts "Your ship's end coordinates do not represent a valid position on the grid. Please re-enter the end coordinates."
          input = gets.chomp
        else
          valid_input = true
        end
      end
    elsif purpose == :target
      until valid_input
        if !possible_cells.include? input.upcase
          puts "That target does not represent a valid position on the grid. Please re-enter the coordinates of your target."
          input = gets.chomp
        else
          valid_input = true
        end
      end
    end
    input.upcase
  end
end