# Bitmap class, handles the pixels and all the basic bitmap operations
class Bitmap
  attr_reader :width, :height, :pixels

  DEFAULT_COLOR = 'O'.freeze

  # initialize to a specific width * height and clear to a default color
  def initialize(width, height)
    @width = width
    @height = height
    clear
  end

  # get a pixel value x,y (1 based)
  def [](x, y)
    @pixels[y - 1][x - 1]
  end

  # set a pixel value x,y (1 based) to a specified color
  def []=(x, y, color)
    @pixels[y - 1][x - 1] = color
  end

  # set every pixel to a color
  def clear(color = DEFAULT_COLOR)
    @pixels = Array.new(@height) { Array.new(@width) { color } }
  end

  # returns every pixel in a pretty console printable format
  def show
    @pixels.map(&:join).join("\n")
  end

  # draws a vertical segment at coords x, y1, y2 of specified color
  def vertical_segment(x, y1, y2, color)
    ([y1, y2].min..[y1, y2].max).each { |y| self[x, y] = color }
  end

  # draws an horizontal segment at coords x1, x2, y of specified color
  def horizontal_segment(x1, x2, y, color)
    @pixels[y - 1].fill(color, ([x1, x2].min - 1)..([x1, x2].max - 1))
  end
end
