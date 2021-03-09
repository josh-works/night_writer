require './lib/helper'

class NightWriter
  attr_reader :input_file_path,
              :output_file_path
  def initialize()
    @input_file_path = ARGV[0]
    @output_file_path = build_output_file_path_from_input_file_path
  end
  
  def build_output_file_path_from_input_file_path
    unless input_file_path 
      raise "oops, no input file given, we don't have anything to write"
    end
    return ARGV[1] if ARGV[1]
    
    path, extension = input_file_path.split(".")
    
    return path + "_copy" + "." + extension
  end
  
  def read_message
    File.open(input_file_path).read
  end
  
  def convert_message_to_braille
    letters = BrailleLetterGenerator.brail_characters(read_message)
    BrailleWriter.write(letters)
  end
  
  def write_message_to_file
    message = convert_message_to_braille
  
    File.open(output_file_path, "w") do |file|
      file.write(message)
    end
    puts "wrote the following message to a file by the title of:"
    puts output_file_path
    puts message
    # puts "the file contains #{message.size} characters"
  end
end
NightWriter.new.write_message_to_file


