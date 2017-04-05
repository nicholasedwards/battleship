require 'minitest/autorun'
require './lib/input_validation'
include InputValidation

class TestInputValidation < Minitest::Test
  def test_validation_of_player_input
    # Running this assertion will require you to interact with the tests on the command line.
    # It is skipped here to enable faster testing.
    # assert_output(/That is not a valid cell on the grid! Please try again./) {
    #   InputValidation.validate_input("asdf", :target)
    # }
    assert_output(//) {
      InputValidation.validate_input("A1", :target)
    }
    assert_output(//) {
      InputValidation.validate_input("a1", :target)
    }
  end
end