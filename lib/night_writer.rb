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
end
puts NightWriter.new.read_message


