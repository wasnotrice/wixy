module Wixy
  class Alphabet
    # chars is an array of character strings, like ["A", "B", "C" ...]
    def initialize(chars, options = {})
      @chars = chars.to_a.rotate(options[:shift] || 0)
      @index = Hash[@chars.each_with_index.to_a]
    end

    def [](index)
      @chars[index % @chars.length]
    end

    def index(char)
      i = @index[char]
    end

    def sanitized_chars(text)
      text.upcase.chars.map { |c| char_if_present(c) }.compact
    end

    # Given a char and another alphabet, find the char in this alphabet
    # at the corresponding index
    def char(char, other_alphabet)
      self[other_alphabet.index(char)]
    end

    def to_s
      "<Alphabet:[#{@chars.join}]>"
    end

    private
    def char_if_present(char)
      char if index(char)
    end
  end
end
