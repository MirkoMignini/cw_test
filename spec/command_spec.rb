require 'dummy/dummy_command'

RSpec.describe Command do
  let(:command) { Command.new(Console.new, []) }
  let(:dummy_command) { Commands::DummyCommand.new(DummyConsole.new, []) }
  let(:dummy_command_class) { Commands::DummyCommand }

  it 'initialize without errors' do
    expect { dummy_command }.not_to raise_error
  end

  it 'raise an error if base command process is called' do
    expect { command.process }.to raise_error(NotImplementedError)
  end

  it 'raise no error if dummy command process is called' do
    expect { dummy_command.process }.not_to raise_error
  end

  context 'Command DSL' do
    it 'responds to dsl methods' do
      expect(dummy_command_class).to respond_to(:help, :command)
    end

    it 'contains the right command text' do
      expect(dummy_command_class.command_text).to eq('D')
    end

    it 'contains the right help text' do
      expect(dummy_command_class.help_text).to eq('Dummy command, does nothing.')
    end
  end

  it 'match case insensitive' do
    expect(dummy_command_class.match?('D')).to eq(true)
    expect(dummy_command_class.match?('d')).to eq(true)
  end
end
