# silly encryption algo
require 'matrix'
class Enshcryptor
  def initialize(string)
    @initial = string
  end

  def encrypted
    @encrypted ||= begin
                     matrix = init_matrix(prepare)
                     encrypt(matrix)
                   end
  end

  private

  def prepare
    stripped = @initial.gsub(/\s+/, '')
    @l_sqrt = Math.sqrt(stripped.length)
    @rows = @l_sqrt.floor
    @cols = @l_sqrt.ceil
    stripped
  end

  def init_matrix(stripped)
    rows = stripped.scan(/.{1,#{@cols}}/).map { |i| i.split('') + Array.new(@cols -i.size, nil) }
    Matrix[*rows]
  end

  def encrypt(matrix)
    Array.new matrix.column_count do |i|
      matrix.column(i).to_a.join ''
    end.join ' '
  end
end
