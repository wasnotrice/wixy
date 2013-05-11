require_relative 'config'
require_relative 'alphabet'

module Wixy
  class Vigenere
    def initialize(config = Config.new)
      @config = config
      @alphabet = Alphabet.AZ
      @key = @alphabet.sanitize(config.key)
    end

    def encrypt(text)
      shift = -> (index, offset) { index + offset }
      solve text, shift
    end

    def decrypt(text)
      shift = -> (index, offset) { index - offset }
      solve text, shift
    end

    private
    def preserve?
      @config.preserve
    end

    def solve(text, shift)
      result = solve_portion(text.chars, 0, shift).reverse
      discard_or_not(result).join
    end

    def solve_portion(text, i, shift)
      return text if text.empty?
      char = text.shift
      if @alphabet.index(char)
        solve_portion(text, i + 1, shift) << lookup(char, i, shift)
      else
        solve_portion(text, i, shift) << char
      end
    end

    def lookup(char, position, shift)
      index = @alphabet.index(char.upcase)
      offset = @alphabet.index(@key[position % @key.length])
      new_index = shift.call(index, offset)
      @alphabet[new_index]
    end

    def discard_or_not(chars)
      preserve? ? chars : @alphabet.sanitize(chars)
    end
  end
end
