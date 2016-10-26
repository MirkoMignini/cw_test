# Bitmap class, handles the pixels and all the basic bitmap operations
class Bitmap
  attr_reader :width, :height, :pixels

  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  def [](x, y)
    @pixels[y - 1][x - 1]
  end

  def []=(x, y, color)
    @pixels[y - 1][x - 1] = color
  end

  def clear(color = 'O')
    @pixels = Array.new(@height) { Array.new(@width) { color } }
  end

  def show
    @pixels.map(&:join).join("\n")
  end

  def vertical_segment(x, y1, y2, color)
    (y1..y2).each { |y| self[x, y] = color }
  end

  def horizontal_segment(x1, x2, y, color)
    @pixels[y - 1].fill(color, (x1 - 1)..(x2 - 1))
  end
end
