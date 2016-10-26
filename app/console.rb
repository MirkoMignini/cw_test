# Object to emulate a simple console, can load dinamically commands from a path
class Console
  attr_reader :commands

  # initialize the console loading commands
  def initialize
    load_commands
  end

  # run the console
  def run
    @running = true
    puts welcome_message
    while @running
      print '> '
      output = process_input(gets.chomp)
      # if the output from command is a non empty string let's print
      puts output unless output.nil? || !output.is_a?(String) || output.strip == ''
    end
  end

  # set the console as stop running
  def stop
    @running = false
  end

  # Process the input, find the matching command and execute
  def process_input(input)
    command = match_command(input)
    begin
      return command ? execute_command(command, input) : unknown_command_message
    rescue ArgumentError => error
      error.to_s
    end
  end

  protected

  # default unknown message
  def unknown_command_message
    'unrecognised command :('
  end

  # default welcome message
  def welcome_message
    'type ? for help'
  end

  # default commands path
  def command_files
    Dir[File.expand_path('commands/**/*.rb', __dir__)]
  end

  private

  # load commands files
  def load_commands
    command_files.each { |file| load(file) }
    @commands = Commands.constants.map(&Commands.method(:const_get)).grep(Class)
  end

  # match an input to find the matching command
  def match_command(input)
    @commands.each do |command|
      return command if command.match?(input[0])
    end
    nil
  end

  # Execute a command creating a new instance
  def execute_command(command, input)
    command.new(self, input).process
  end
end
