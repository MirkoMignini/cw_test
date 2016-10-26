require 'dummy/dummy_console'

RSpec.describe Console do
  let(:console) { DummyConsole.new }

  it 'initialize without errors' do
    expect { console }.not_to raise_error
  end

  it 'load commands' do
    expect(console.commands.count).to be > 0
  end

  context 'process input' do
    it 'process an existing command' do
      expect(console.process_input('D')).to eq('works')
    end

    it 'returns an error message for not existing commands' do
      expect(console.process_input('A')).to eq('unrecognised command :(')
    end
  end
end
