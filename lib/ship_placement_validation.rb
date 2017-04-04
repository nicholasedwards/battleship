module ShipPlacementValidation
  def validate_small_ship(start_row_index, start_column_index, end_row_index, end_column_index, user)
    if ship_is_diagonal?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a ship diagonally! Your ship can only be horizontal or vertical. Please try again." if user == :player
      return false
    elsif small_ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a small ship that is greater than two cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please try again." if user == :player
      return false
    else
      return true
    end
  end

  def validate_large_ship(start_row_index, start_column_index, end_row_index, end_column_index, user)
    if ship_is_diagonal?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a ship diagonally! Your ship can only be horizontal or vertical. Please try again." if user == :player
      return false
    elsif large_ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a large ship that is greater than three cells long, or would wrap around the grid! The coordinates must correspond to the first and last cells of the ship. Please try again." if user == :player
      return false
    elsif large_ship_is_too_small(start_row_index, start_column_index, end_row_index, end_column_index)
      puts "You tried placing a large ship that is smaller than three cells long! The coordinates must correspond to the first and last cells of the ship. Please try again." if user == :player
    else
      return true
    end
  end

  def ship_is_diagonal?(start_row_index, start_column_index, end_row_index, end_column_index)
    ( start_row_index != end_row_index ) && ( start_column_index != end_column_index )
  end

  def small_ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
    ( end_column_index - start_column_index ) > 1 || ( end_row_index - start_row_index ) > 1
  end

  def large_ship_wraps_or_is_too_long?(start_row_index, start_column_index, end_row_index, end_column_index)
    ( end_column_index - start_column_index ) > 2 || ( end_row_index - start_row_index ) > 2 
  end

  def large_ship_is_too_small(start_row_index, start_column_index, end_row_index, end_column_index)
    ( end_column_index - start_column_index ) == 1 || ( end_row_index - start_row_index ) == 1
  end

  def no_overlaps?(start_row_index, start_column_index, end_row_index, end_column_index, user)
    if start_row_index == end_row_index && start_column_index == end_column_index
      puts "You tried placing a ship that would overlap over itself! Please try again." if user == :player
      return false
    elsif self[start_row_index][start_column_index].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again." if user == :player
      return false
    elsif self[end_row_index][end_column_index].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again." if user == :player
      return false
    elsif self[ ( start_row_index + end_row_index ) / 2 ][start_column_index].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again." if user == :player
      return false
    elsif self[start_row_index][ ( start_column_index + end_column_index ) / 2 ].is_ship? == true
      puts "You tried placing a ship that would overlap over another ship! Please try again." if user == :player
      return false
    else
      return true
    end
  end
end