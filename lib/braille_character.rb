class BrailleCharacter
  attr_reader :braille, :string, :english
  def initialize(braille: nil, english: nil)
    @braille = { 
      top: braille.split()[0],
      mid: braille.split()[1],
      btm: braille.split()[2],
      }
    @string = braille
    @english = english
  end
  
  alias_method :to_s, :string
end