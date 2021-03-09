class BrailleWriter
  def self.write(braille)
    output_top = ""
    output_mid = ""
    output_btm = ""
    braille.each do |char|
      output_top << char.braille[:top]
      output_mid << char.braille[:mid]
      output_btm << char.braille[:btm]
    end
    puts output_top
    puts output_mid
    puts output_btm
  end
end