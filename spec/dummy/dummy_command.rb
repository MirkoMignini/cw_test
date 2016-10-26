require_relative '../../app/command'

module Commands
  class DummyCommand < Command
    command 'D'
    help 'Dummy command, does nothing.'

    def process
      'works'
    end
  end
end
