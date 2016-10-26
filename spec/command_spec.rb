require_relative '../app/commands/create'

RSpec.describe Command do
  let(:command) { Command.new(Console.new, '') }
  let(:create_command) { Commands::Create.new(BitmapEditor.new, 'I 2 3') }
  let(:create_command_class) { Commands::Create }

  it 'initialize without errors' do
    expect { create_command }.not_to raise_error
  end

  it 'raise an error if base command process is called' do
    expect { command.process }.to raise_error(NotImplementedError)
  end

  it 'raise no error if real command process is called' do
    expect { create_command.process }.not_to raise_error
  end

  context 'Command DSL' do
    it 'responds to dsl methods' do
      expect(Command).to respond_to(:help, :command, :params)
    end

    it 'contains the right command text' do
      expect(create_command_class.command_text).to eq('I')
    end

    it 'contains the right help text' do
      expect(create_command_class.help_text).to start_with('Create a new M x N')
    end

    it 'contains the right command params' do
      expect(create_command_class.declared_params).to eq(m: :integer, n: :integer)
    end
  end

  context 'Parameters validation' do
    it 'returns an error if no arguments' do
      expect do
        Commands::Create.new(BitmapEditor.new, 'I')
      end.to raise_error(ArgumentError, '2 parameters expected.')
    end

    it 'returns an error if less arguments' do
      expect do
        Commands::Create.new(BitmapEditor.new, 'I 2')
      end.to raise_error(ArgumentError, '2 parameters expected.')
    end

    it 'returns no error if right arguments' do
      expect do
        Commands::Create.new(BitmapEditor.new, 'I 2 3')
      end.not_to raise_error
    end

    it 'returns no error if more arguments' do
      expect do
        Commands::Create.new(BitmapEditor.new, 'I 2 3 4')
      end.not_to raise_error
    end

    it 'returns an error if wrong params type' do
      expect do
        Commands::Create.new(BitmapEditor.new, 'I 2 f')
      end.to raise_error(ArgumentError, 'Param n must be a integer')
    end
  end

  it 'match case insensitive' do
    expect(create_command_class.match?('I')).to eq(true)
    expect(create_command_class.match?('i')).to eq(true)
  end
end
