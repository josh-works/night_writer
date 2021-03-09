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
  
  def test_all_has_all_characters
    assert_equal 26, BrailleCharacter.all.count
    assert_instance_of BrailleCharacter, BrailleCharacter.all.first
  end
  
  def test_find_can_get_character
    assert_instance_of BrailleCharacter, BrailleCharacter.find("a")
  end
  
end