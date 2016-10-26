require 'benchmark/ips'

# Benchmark to understand if is better to use a single array
# or an array of arrays to store bitmap pixels
# Results:
#         Array[Array]:    39186.9 i/s
#              Array[]:    33663.8 i/s - 1.16x  slower

Benchmark.ips do |x|
  img = Array.new(250 * 250, 'O')
  x.report('Array[]') do
    (0..249).each { |v| img[v * 250 + v] = v }
  end
  img2 = Array.new(250) { Array.new(250) { 'O' } }
  x.report('Array[Array]') do
    (0..249).each { |v| img2[v][v] = v }
  end
  x.compare!
end
