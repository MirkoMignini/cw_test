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

    context 'Initialization validations' do
      it 'returns an error if width or height are invalid' do
        expect { Bitmap.new(1000, 3) }.to raise_error(ArgumentError)
        expect { Bitmap.new(4, 1000) }.to raise_error(ArgumentError)
        expect { Bitmap.new(4, 0) }.to raise_error(ArgumentError)
        expect { Bitmap.new(0, 4) }.to raise_error(ArgumentError)
      end
    end

    context 'Pixels operations' do
      context 'Set' do
        it 'works with good values' do
          bitmap[1, 2] = 'C'
          expect(pixels).to eq('OOOCOOOOO')
        end

        it 'returns an error if values out of bounds' do
          expect { bitmap[9, 1] = 'C' }.to raise_error(ArgumentError)
          expect { bitmap[1, 9] = 'C' }.to raise_error(ArgumentError)
        end
      end

      context 'Get' do
        it 'works with good values' do
          bitmap[1, 2] = 'C'
          expect(bitmap[1, 2]).to eq('C')
        end

        it 'returns an error if values out of bounds' do
          expect { bitmap[9, 1] }.to raise_error(ArgumentError)
          expect { bitmap[1, 9] }.to raise_error(ArgumentError)
        end
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

      it 'returns an error if values out of bounds' do
        expect { bitmap.horizontal_segment(9, 3, 1, 'C') }.to raise_error(ArgumentError)
        expect { bitmap.horizontal_segment(2, 9, 1, 'C') }.to raise_error(ArgumentError)
        expect { bitmap.horizontal_segment(2, 3, 9, 'C') }.to raise_error(ArgumentError)
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

      it 'returns an error if values out of bounds' do
        expect { bitmap.vertical_segment(9, 2, 3, 'C') }.to raise_error(ArgumentError)
        expect { bitmap.vertical_segment(1, 9, 3, 'C') }.to raise_error(ArgumentError)
        expect { bitmap.vertical_segment(1, 2, 9, 'C') }.to raise_error(ArgumentError)
      end
    end
  end
end
