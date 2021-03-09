require './lib/braille_character'
require './lib/braille_writer'



translation = {
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

@characters = []

translation.each do |english, braille|
  @characters << BrailleCharacter.new(english: english, braille: braille)
end

BrailleWriter.write(@characters)
