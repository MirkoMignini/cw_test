require_relative '../command.rb'

module Commands
  class Show < Command
    command 'S'
    help 'Show the contents of the current image.'

    def process
      puts console.bitmap.show
    end
  end
end
