require_relative './bitmap'
require_relative './console'

# Bitmap editor, just a console that handles a bitmap
class BitmapEditor < Console
  attr_writer :bitmap

  def bitmap
    raise StandardError, 'It is necessary to initialize a bitmap before' if @bitmap.nil?
    @bitmap
  end
end
