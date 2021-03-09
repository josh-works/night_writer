class BrailleLetterGenerator
  def self.brail_characters(string)
    string.split("").map do |char|
      if BrailleCharacter.find(char)
        BrailleCharacter.find(char)
      else
        char
      end
    end
  end
end