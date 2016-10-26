require_relative '../command.rb'

module Commands
  class Help < Command
    command '?'
    help 'Help.'

    def process
      console.commands.each do |command|
        puts "#{command.command_text} - #{command.help_text}"
      end
    end
  end
end
