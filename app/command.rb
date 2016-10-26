# Base command object to handle all the general commands behaviour
class Command
  attr_reader :console, :params

  class << self
    attr_reader :command_text, :help_text

    def command(command_text)
      @command_text = command_text
    end

    def help(help_text)
      @help_text = help_text
    end

    def match?(input)
      input.casecmp(command_text).zero?
    end
  end

  # initialize a command,
  # save parent console and process user input parameters
  def initialize(console, input)
    @console = console
    build_params(input)
  end

  # process must be implemented in specified commands
  def process
    raise NotImplementedError
  end

  private

  # build params list from input
  def build_params(input)
    @params = {}
    # TODO
  end
end
