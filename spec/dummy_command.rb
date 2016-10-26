class DummyCommand < Command
  command 'D'
  help 'Dummy command, does nothing.'

  def process
    # does nothing
  end
end
