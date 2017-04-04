require 'minitest/autorun'
require './lib/input_validation'

class TestInputValidation < Minitest::Test
  def test_validation_of_player_input
    assert_output(/That is not a valid cell on the grid! Please try again./) {
      InputValidation.validate_input("asdf")
    }
    assert_output(//) {
      InputValidation.validate_input("A1")
    }
  end
end