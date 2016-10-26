# Object to emulate a simple console, can load dinamically commands from a path
class Console
  attr_reader :commands

  # initialize the console loading commands
  def initialize
    load_commands
  end

  private

  # default commands path
  def command_files
    Dir[File.expand_path('commands/**/*.rb', __dir__)]
  end

  # load commands files
  def load_commands
    command_files.each { |file| load(file) }
    @commands = Commands.constants.map(&Commands.method(:const_get)).grep(Class)
  end
end
