# Base command object to handle all the general commands behaviour
class Command
  attr_reader :console, :params

  # Simple DSL to define commands
  class << self
    attr_reader :command_text, :help_text

    # DSL function to set input command
    # example
    # command 'A'
    def command(command_text)
      @command_text = command_text
    end

    # DSL function to set text help
    # example
    # help 'This is the help.'
    def help(help_text)
      @help_text = help_text
    end

    # DSL function to add a param
    # example
    # params m: :integer, n: :integer
    # possible param types :integer and :letter
    def params(list)
      @declared_params = list
    end

    # Match input with command, case insensitive
    def match?(input)
      input.casecmp(command_text).zero?
    end

    def declared_params
      @declared_params ||= []
    end
  end

  # initialize a command,
  # save parent console and process user input parameters
  def initialize(console, input)
    @console = console
    build_params(input)
  end

  # Helper to return declared params from class
  def declared_params
    self.class.declared_params
  end

  # process must be implemented in specified commands
  def process
    raise NotImplementedError
  end

  private

  # build params list from input
  def build_params(input)
    # prepare empty params hash
    @params = {}
    # separate command from other params
    _command, *input_params = input.split(' ')
    # check arguments count before proceed
    check_arguments_count(input_params)
    # validate every input param and put in params hash
    declared_params.each_with_index do |param, index|
      @params[param[0]] = validate_param(param, input_params[index])
    end
  end

  # Check if the number of params the function receive
  # is at least big as in declared params, ignore extra parameters
  def check_arguments_count(input_params)
    return if input_params.count >= declared_params.count
    raise ArgumentError, "#{declared_params.count} parameters expected."
  end

  # validate a param based on the same declared param
  def validate_param(declared_param, input_param)
    case declared_param[1]
    when :integer
      return input_param.to_i if integer?(input_param)
    when :letter
      return input_param if letter?(input_param)
    end
    raise ArgumentError, "Param #{declared_param[0]} must be a #{declared_param[1]}"
  end

  # check if the input is an integer
  def integer?(string)
    true if Integer(string)
  rescue
    false
  end

  # check if the input is a single letter
  def letter?(string)
    string =~ /[A-Za-z]/
  end
end
