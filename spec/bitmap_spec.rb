require_relative '../app/bitmap'

RSpec.describe Bitmap do
  describe 'Basic operations' do
    let(:bitmap) { Bitmap.new(3, 3) }
    let(:pixels) { bitmap.pixels.join }

    it 'creates an empty bitmap' do
      expect(pixels).to eq('OOOOOOOOO')
    end

    it 'clears the pixels' do
      bitmap.vertical_segment(1, 2, 3, 'C')
      bitmap.clear
      expect(pixels).to eq('OOOOOOOOO')
    end

    it 'returns the pixels in pretty format' do
      expect(bitmap.show).to eq("OOO\nOOO\nOOO")
    end

    context 'Pixels operations' do
      it 'set a pixel' do
        bitmap[1, 2] = 'C'
        expect(pixels).to eq('OOOCOOOOO')
      end

      it 'get a pixel' do
        bitmap[1, 2] = 'C'
        expect(bitmap[1, 2]).to eq('C')
      end
    end

    context 'Horizontal line' do
      it 'works when x1 < x2' do
        bitmap.horizontal_segment(2, 3, 1, 'C')
        expect(pixels).to eq('OCCOOOOOO')
      end

      it 'works when x1 = x2' do
        bitmap.horizontal_segment(2, 2, 1, 'C')
        expect(pixels).to eq('OCOOOOOOO')
      end

      it 'works when x1 > x2' do
        bitmap.horizontal_segment(3, 2, 1, 'C')
        expect(pixels).to eq('OCCOOOOOO')
      end
    end

    context 'Vertical line' do
      it 'works when y1 < y2' do
        bitmap.vertical_segment(1, 2, 3, 'C')
        expect(pixels).to eq('OOOCOOCOO')
      end

      it 'works when y1 = y2' do
        bitmap.vertical_segment(1, 2, 2, 'C')
        expect(pixels).to eq('OOOCOOOOO')
      end

      it 'works when y1 > y2' do
        bitmap.vertical_segment(1, 3, 2, 'C')
        expect(pixels).to eq('OOOCOOCOO')
      end
    end
  end
end
