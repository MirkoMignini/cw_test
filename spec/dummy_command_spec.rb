require 'dummy_command'

RSpec.describe DummyCommand do
  let(:console) { Console.new }
  let(:command) { DummyCommand.new(console, []) }

  it 'initialize without errors' do
    expect { command }.not_to raise_error
  end

  it 'raise no error if process is called' do
    expect { command.process }.not_to raise_error
  end

  it 'contains the right command text' do
    expect(DummyCommand.command_text).to eq('D')
  end

  it 'contains the right help text' do
    expect(DummyCommand.help_text).to eq('Dummy command, does nothing.')
  end
end
