class Night_Writer

  def initialize()
    @braille_hash = {
      "a" => [["0","."],[".","."],[".","."]],
      "b" => [["0","."],["0","."],[".","."]],
      "c" => [["0","0"],[".","."],[".","."]],
      "d" => [["0","0"],[".","0"],[".","."]],
      "e" => [["0","."],[".","0"],[".","."]],
      "f" => [["0","0"],["0","."],[".","."]],
      "g" => [["0","0"],["0","0"],[".","."]],
      "h" => [["0","."],["0","0"],[".","."]],
      "i" => [[".","0"],["0","."],[".","."]],
      "j" => [[".","0"],["0","0"],[".","."]],
      "k" => [["0","."],[".","."],["0","."]],
      "l" => [["0","."],["0","."],["0","."]],
      "m" => [["0","0"],[".","."],["0","."]],
      "n" => [["0","0"],[".","0"],["0","."]],
      "o" => [["0","."],[".","0"],["0","."]],
      "p" => [["0","0"],["0","."],["0","."]],
      "q" => [["0","0"],["0","0"],["0","."]],
      "r" => [["0","."],["0","0"],["0","."]],
      "s" => [[".","0"],["0","."],["0","."]],
      "t" => [[".","0"],["0","0"],["0","."]],
      "u" => [["0","."],[".","."],["0","0"]],
      "v" => [["0","."],["0","."],["0","0"]],
      "w" => [[".","0"],["0","0"],[".","0"]],
      "x" => [["0","0"],[".","."],["0","0"]],
      "y" => [["0","0"],[".","0"],["0","0"]],
      "z" => [["0","."],[".","0"],["0","0"]],
      " " => [[" "],[" "],[" "]]
    }
  end

  def convert_to_braille (string)
    line_num = 0
    converted_string = ""
    forty_characters = ""
    while string.length > 0
      forty_characters = string.slice!(0...40)
      while line_num < 3
        forty_characters.downcase.each_char {
          |letter| braille_line = @braille_hash[letter][line_num]
          braille_line.each do |char|
            converted_string += char
          end
        }
        converted_string += "\n"
        line_num += 1
      end
      line_num = 0
    end
    converted_string
  end

end

require 'minitest/autorun'

class NightWriter < Minitest::Test
  def test_foo
    foo_braille = Night_Writer.new.convert_to_braille("foo")
    assert_equal("000.0.\n0..0.0\n..0.0.\n", foo_braille)
  end
end
