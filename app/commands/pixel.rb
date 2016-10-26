require_relative '../command.rb'

module Commands
  class Pixel < Command
    command 'L'
    help 'Colours the pixel (X,Y) with colour C.'
    params x: :integer, y: :integer, c: :letter

    def process
      console.bitmap[params[:x], params[:y]] = params[:c]
    end
  end
end
