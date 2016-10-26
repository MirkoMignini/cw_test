require_relative '../command.rb'

module Commands
  class VerticalSegment < Command
    command 'V'
    help 'Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).'
    params x: :integer, y1: :integer, y2: :integer, c: :letter

    def process
      console.bitmap.vertical_segment(params[:x], params[:y1], params[:y2], params[:c])
      nil
    end
  end
end
