module Wixy
  class Vigenere
    def initialize(key = "SUSHIFROGGY")
      @alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.chars
      @key = clean(key)
    end

    def encrypt(cleartext)
      cleaned = clean(cleartext)
      cleaned.each_with_index.map do |char, i|
        lookup(char, i)
      end.compact.join
    end

    def lookup(char, position)
      char_index = index_of(char.upcase)
      if char_index
        key_index = index_of(@key[position % @key.length])
        @alphabet[(char_index + key_index) % @alphabet.length]
      end
    end

    def index_of(character)
      @character_map ||= @alphabet.each_with_index.each_with_object({}) { |(c, i), map| map[c] = i }
      @character_map[character]
    end

    private
    def clean(text)
      text.upcase.each_char.map { |c| index_of(c) ? c : nil }.compact
    end
  end
end
