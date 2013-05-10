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
      # lookup_with_shift text, shift
    end

    def decrypt(text)
      shift = -> (index, offset) { index - offset }
      solve text, shift
      # lookup_with_shift text, shift
    end

    def lookup_with_shift(text, shift)
      cleaned = @alphabet.sanitize(text)
      cleaned.each_with_index.map do |char, i|
        lookup(char, i, shift)
      end.compact.join
    end

    def solve(text, shift)
      result = recurse(text.chars, 0, shift).reverse
      discard_or_not(result).join
    end

    def recurse(text, i, shift)
      return text if text.empty?
      char = text.shift
      if @alphabet.index(char)
        recurse(text, i + 1, shift) << lookup(char, i, shift)
      else
        recurse(text, i, shift) << char
      end
    end

    def discard_or_not(chars)
      preserve? ? chars : @alphabet.sanitize(chars)
    end

    def lookup(char, position, shift)
      index = @alphabet.index(char.upcase)
      offset = @alphabet.index(@key[position % @key.length])
      new_index = shift.call(index, offset)
      @alphabet[new_index]
    end

    private
    def preserve?
      @config.preserve
    end
  end
end
