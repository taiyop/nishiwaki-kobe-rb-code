class Matrix
  def initialize(string)
    @_matrix = string2matrix(string)
  end

  #
  # 転置する
  #
  def transpose
    transposed_matrix = []

    @_matrix[0].size.times.each do |_|
      transposed_matrix << []
    end

    @_matrix.each.with_index(0) do |array, line|
      array.each.with_index(0) do |elm, row|
        transposed_matrix[row] << elm
      end
    end

    @_matrix = transposed_matrix
  end

  def output
    @_matrix.each do |line_array|
      puts line_array.join(' ')
    end
  end

  private
  #
  # @param [String]
  #
  def string2matrix(string)
    matrix = []
    string.each_line do |line|
      array = line.split(' ')
      matrix << array
    end
    matrix
  end
end

input = <<~EOS
  1 2 3
  4 5 6
  7 8 9
EOS


### EXECUTION #######

puts "---before-----"
puts input

puts "---after-----"

new_matrix = Matrix.new(input)
new_matrix.transpose
new_matrix.output
