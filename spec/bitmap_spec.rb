require_relative '../app/bitmap'

RSpec.describe Bitmap do
  describe 'Basic operations' do
    let(:bitmap) { Bitmap.new(3, 3) }
    let(:pixels) { bitmap.pixels.join }

    it 'creates an empty bitmap' do
      expect(pixels).to eq('OOOOOOOOO')
    end

    it 'draws a pixel' do
      bitmap[1, 2] = 'C'
      expect(pixels).to eq('OOOCOOOOO')
    end

    it 'draws an horizontal line' do
      bitmap.horizontal_segment(2, 3, 1, 'C')
      expect(pixels).to eq('OCCOOOOOO')
    end

    it 'draws a vertical line' do
      bitmap.vertical_segment(1, 2, 3, 'C')
      expect(pixels).to eq('OOCOOCOOO')
    end

    it 'clears the pixels' do
      bitmap.vertical_segment(1, 2, 3, 'C')
      bitmap.clear
      expect(pixels).to eq('OOOOOOOOO')
    end
  end
end
