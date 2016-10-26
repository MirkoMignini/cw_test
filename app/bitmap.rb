# Bitmap class, handles the pixels and all the basic bitmap operations
class Bitmap
  attr_reader :width, :height, :pixels

  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  def [](x, y)
  end

  def []=(x, y, color)
  end

  def clear(color = 'O')
    @pixels = Array.new(@height) { Array.new(@width) { color } }
  end

  def show
  end

  def vertical_segment(x, y1, y2, color)
  end

  def horizontal_segment(x1, x2, y, color)
  end
end
