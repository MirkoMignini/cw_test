require_relative '../command.rb'

module Commands
  class Exit < Command
    command 'X'
    help 'Terminate the session.'

    def process
      console.stop
    end
  end
end
