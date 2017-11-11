class Matrix
  def initialize(matrix_string)
    @matrix_array = matrixize(matrix_string)
  end

  #
  # 転置する
  #
  def transpose
    transposed_matrix = []

    # 新しい空の行列を作成
    @matrix_array[0].size.times.each do |_|
      transposed_matrix << []
    end

    # 空の行列にデータを挿入
    @matrix_array.each.with_index(0) do |array, _line|
      array.each.with_index(0) do |elm, row|
        transposed_matrix[row] << elm
      end
    end

    @matrix_array = transposed_matrix
  end

  def output
    @matrix_array.each do |line_array|
      puts line_array.join(' ')
    end
  end

  private

  #
  # 行列構造のArrayへ変換
  #
  # @param [String]
  #
  # @return [Array] e.g. [[1,2,3], [2,3,4], [4,5,6]]
  #
  def matrixize(string)
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

puts "==============="

next_input = <<~EOS
  1 2
  4 5
  7 8
EOS
puts "---before-----"
puts next_input

puts "---after-----"

next_matrix = Matrix.new(next_input)
next_matrix.transpose
next_matrix.output

