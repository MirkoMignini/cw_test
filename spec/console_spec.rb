require_relative '../app/console'

RSpec.describe Console do
  let(:console) { Console.new }

  it 'initialize without errors' do
    expect { console }.not_to raise_error
  end

  it 'load commands' do
    expect(console.commands.count).to be > 0
  end
end
