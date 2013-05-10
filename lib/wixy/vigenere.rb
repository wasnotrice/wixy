require_relative 'config'
require_relative 'alphabet'

module Wixy
  class Vigenere
    ENCRYPT = 1
    DECRYPT = -1

    def initialize(config = Config.new)
      @config = config
      @alphabet = Alphabet.new ('A'..'Z')
      @key = @alphabet.sanitized_chars(config.key)
    end

    def encrypt(text)
      cleaned = @alphabet.sanitized_chars(text)
      cleaned.each_with_index.map do |char, i|
        lookup(char, i, ENCRYPT)
      end.compact.join
    end

    def decrypt(text)
      cleaned = @alphabet.sanitized_chars(text)
      cleaned.each_with_index.map do |char, i|
        lookup(char, i, DECRYPT)
      end.compact.join
    end

    def lookup(char, position, direction)
      index = @alphabet.index(char.upcase)
      shift = @alphabet.index(@key[position % @key.length])
      @alphabet[(index + shift * direction)]
    end
  end
end
