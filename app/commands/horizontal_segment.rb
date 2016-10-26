require_relative '../command.rb'

module Commands
  class HorizontalSegment < Command
    command 'H'
    help 'Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).'
    params x1: :integer, x2: :integer, y: :integer, c: :letter

    def process
      console.bitmap.horizontal_segment(params[:x1], params[:x2], params[:y], params[:c])
      nil
    end
  end
end
