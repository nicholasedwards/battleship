require 'pry'
module InputValidation
  def validate_input(input, purpose)
    if purpose == :start
      get_valid_input(input, :start)
    elsif purpose == :end
      get_valid_input(input, :end)
    elsif purpose == :target
      get_valid_input(input, :target)
    end
    input.upcase
  end

  def get_valid_input(input, purpose)
    possible_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    valid_input = false
    until valid_input
      if !possible_cells.include? input.upcase
        puts "Your ship's start coordinates do not represent a valid position on the grid. Please re-enter the squares for the ship." if purpose == :start
        puts "Your ship's end coordinates do not represent a valid position on the grid. Please re-enter the end coordinates." if purpose == :end
        puts "That target does not represent a valid position on the grid. Please re-enter the coordinates of your target." if purpose == :target
        input = gets.chomp
      else
        valid_input = true
      end
    end
  end

end