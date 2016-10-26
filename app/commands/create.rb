require_relative '../command.rb'

module Commands
  # Create command
  class Create < Command
    command 'I'
    help 'Create a new M x N image with all pixels coloured white (O).'
    params m: :integer, n: :integer

    def process
      console.bitmap = Bitmap.new(params[:m], params[:n])
    end
  end
end
