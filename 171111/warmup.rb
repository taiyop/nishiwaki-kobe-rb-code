input = <<~EOS
  1 2 3
  4 5 6
  7 8 9
EOS

puts "---before-----"

puts input

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

def transpose(matrix)
  transposed_matrix = []

  matrix[0].size.times.each do |_|
    transposed_matrix << []
  end

  matrix.each.with_index(0) do |array, line|
    array.each.with_index(0) do |elm, row|
      transposed_matrix[row] << elm
    end
  end

  transposed_matrix
end

#
# @param [Array] e.g. [[1,2,3], [2,3,4], [4,5,6]]
#
def output(matrix)
  matrix.each do |line_array|
    puts line_array.join(' ')
  end
end

matrix = string2matrix(input)

puts "---after-----"

output(transpose(matrix))

# class Matrix
#   def initialize(string)
#   end
#
#   def output
#   end
# end
