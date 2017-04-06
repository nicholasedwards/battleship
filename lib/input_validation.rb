module InputValidation
  def validate_input(grid, input, purpose)
    if purpose == :start
      input = get_valid_input(grid, input, :start)
    elsif purpose == :end
      input = get_valid_input(grid, input, :end)
    elsif purpose == :target
      input = get_valid_input(grid, input, :target)
    end
    input.upcase
  end

  def get_valid_input(grid, input, purpose)
    row_index, column_index = format_position(input)
    possible_cells = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    valid_input = false
    until valid_input
      if !possible_cells.include? input.upcase
        puts "Your ship's start coordinates do not represent a valid position on the grid. Please re-enter the squares for the ship." if purpose == :start
        puts "Your ship's end coordinates do not represent a valid position on the grid. Please re-enter the end coordinates." if purpose == :end
        puts "That target does not represent a valid position on the grid. Please re-enter the coordinates of your target." if purpose == :target
        input = gets.chomp
      elsif purpose == :target && ( !grid[row_index].nil? && !grid[row_index][column_index].nil?) && ( grid[row_index][column_index].status == "M" || grid[row_index][column_index].status == "H" )
        puts "You have already fired on that cell. Please enter a cell that you have not yet fired on."
        input = gets.chomp
        row_index, column_index = format_position(input)
      else
        valid_input = true
      end
    end
    input
  end
end