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
  
  def self.find(character)
    BrailleCharacter.all.find do |char|
      char.english == character.to_sym
    end
  end
  
  def self.all
    @all ||= load_data 
  end
  
  private
  
  def self.load_data
    chars = {
      a: ".0\n0.\n..",
      b: "..\n..\n..",
      c: "..\n0.\n..",
      d: "..\n.0\n..",
      e: "..\n..\n.0",
      f: "..\n..\n.0",
      g: "..\n00\n..",
      h: "0.\n..\n..",
      i: ".0\n0.\n..",
      j: "..\n..\n.0",
      k: "..\n..\n..",
      l: "..\n0.\n..",
      m: "..\n0.\n..",
      n: ".0\n..\n..",
      o: "0.\n..\n..",
      p: "..\n..\n0.",
      q: "..\n..\n00",
      r: "..\n..\n..",
      s: "..\n.0\n..",
      t: ".0\n..\n..",
      u: ".0\n0.\n..",
      v: "..\n..\n..",
      w: "..\n.0\n..",
      x: ".0\n..\n..",
      y: "..\n0.\n..",
      z: "..\n.0\n..",
    }
    
    chars.map do |english, braille|
      BrailleCharacter.new(english: english, braille: braille)
    end
  end
  
end