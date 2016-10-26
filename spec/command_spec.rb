require_relative '../app/command'

RSpec.describe Command do
  let(:console) { Console.new }
  let(:command) { Command.new(console, []) }

  it 'initialize without errors' do
    expect { command }.not_to raise_error
  end

  it 'raise an error if process is called' do
    expect { command.process }.to raise_error(NotImplementedError)
  end
end
