require_relative '../command.rb'

module Commands
  class Clear < Command
    command 'C'
    help 'Clears the table, setting all pixels to white (O).'

    def process
      console.bitmap.clear
    end
  end
end
