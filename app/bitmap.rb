# Bitmap class, handles the pixels and all the basic bitmap operations
class Bitmap
  attr_reader :width, :height, :pixels

  DEFAULT_COLOR = 'O'.freeze
  MAX_WIDTH = 250
  MAX_HEIGHT = 250

  # initialize to a specific width * height and clear to a default color
  def initialize(width, height)
    raise ArgumentError, "Width not between 1 and #{MAX_WIDTH}" if width > MAX_WIDTH || width < 1
    raise ArgumentError, "Height not between 1 and #{MAX_HEIGHT}" if height > MAX_HEIGHT || height < 1
    @width = width
    @height = height
    clear
  end

  # get a pixel value x,y (1 based)
  def [](x, y)
    validate_x_y_coords(x, y)
    @pixels[y - 1][x - 1]
  end

  # set a pixel value x,y (1 based) to a specified color
  def []=(x, y, color)
    validate_x_y_coords(x, y)
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
    validate_x_coords(x)
    validate_y_coords(y1, y2)
    ([y1, y2].min..[y1, y2].max).each { |y| self[x, y] = color }
  end

  # draws an horizontal segment at coords x1, x2, y of specified color
  def horizontal_segment(x1, x2, y, color)
    validate_x_coords(x1, x2)
    validate_y_coords(y)
    @pixels[y - 1].fill(color, ([x1, x2].min - 1)..([x1, x2].max - 1))
  end

  private

  # creates dinamically two methods to validate
  # one or more coordinates along x or y axis
  %w(x y).each do |method|
    define_method("validate_#{method}_coords") do |*coords|
      coords.each do |val|
        next if val.positive? && val <= (method == 'x' ? @width : @height)
        raise ArgumentError, "#{val} is out of bounds"
      end
    end
  end

  # helpers to check x, y coord in one line
  def validate_x_y_coords(x, y)
    validate_x_coords(x)
    validate_y_coords(y)
  end
end
