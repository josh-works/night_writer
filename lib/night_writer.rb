class NightWriter
  attr_reader :input_file_path,
              :output_file_path
  def initialize()
    @input_file_path = ARGV[0]
    @output_file_path = ARGV[1]
  end
  
  def read_message
    File.open(input_file_path).read
  end
  
  def write_message_to_file
    message = read_message
    message += " This message was created at: " + Time.now.to_s
    File.open(output_file_path, "w") do |file|
      file.write(message)
    end
    puts "wrote the following message to a file by the title of:"
    puts output_file_path
    puts message
  end
end
puts NightWriter.new.write_message_to_file


