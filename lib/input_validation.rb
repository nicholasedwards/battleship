require 'pry'
module InputValidation
  def validate_input(input)
    valid_input = false
    possible_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4", ]
    until valid_input
      if !possible_cells.include? input.upcase
        puts "That is not a valid cell on the grid! Please re-type and enter a single cell."
        input = gets.chomp
      else
        valid_input = true
      end
    end
    input.upcase
  end
end