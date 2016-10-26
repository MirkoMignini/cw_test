require_relative '../command.rb'

module Commands
  class Help < Command
    command '?'
    help 'Help.'

    def process
      console.commands.each do |command|
        puts "#{command.command_text} #{params_to_string(command.declared_params)} "\
             "- #{command.help_text}"
      end
    end

    def params_to_string(str)
      str.map(&:first).join(' ').upcase
    end
  end
end
