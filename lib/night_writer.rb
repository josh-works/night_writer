class NightWriter
  
  # read contents of a file in ruby (Look up File.open)
  # https://ruby-doc.org/core-2.6.5/File.html
  
  # write it to another file
  
  def get_cli_arguments
    require "pry"; binding.pry
    ARGV
  end
  
  def print_message
    file = File.open("message.txt").read
    puts file
  end
  
  
end

NightWriter.new.get_cli_arguments
# NightWriter.new.print_message

# Test how this works with the following in your terminal:
# ruby lib/night_writer.rb
