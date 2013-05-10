module Wixy
  class Alphabet
    # chars is an array of character strings, like ["A", "B", "C" ...]
    def initialize(chars, options = {})
      @chars = chars.to_a.rotate(options[:shift] || 0)
      @index = Hash[@chars.each_with_index.to_a]
      @filters = options[:filters] || []
    end

    def [](index)
      @chars[index % @chars.length]
    end

    def index(char)
      i = @index[filtered char]
    end

    def include?(char)
      index(filtered char)
    end

    def filtered(char)
      @filters.inject(char) { |c, f| c.public_send(f) }
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

    # Factories

    # A basic alphabet of capital English letters. Given a lowercase
    # letter, will find the corresponding uppercase letters. When
    # using this alphabet to encrypt or decrypt a message, your result
    # will be all uppercase.
    def self.AZ(options = {})
      self.new ('A'..'Z'), {filters: [:upcase]}.merge(options)
    end
  end
end
