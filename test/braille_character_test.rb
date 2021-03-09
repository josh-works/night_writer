gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_character'


class BrailleCharacterTest < Minitest::Test
  
  def test_has_braille_input
    char = {
      braille: "0.\n00\n..",
      english: "h"
      }
    bc = BrailleCharacter.new(char)
    
    by_position = {
      top: "0.",
      mid: "00",
      btm: ".."
    }
    assert_equal char[:braille], bc.to_s
    assert_equal by_position, bc.braille
    assert_equal "h", bc.english
  end
  
end