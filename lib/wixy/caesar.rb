require 'wixy/alphabet'

module Wixy
  class Caesar
    def initialize(options = {})
      @text_alphabet = Alphabet.AZ
      @cipher_alphabet = Alphabet.AZ shift: (options[:shift] || 3)
    end

    def encrypt(text)
      substitute(text, @text_alphabet, @cipher_alphabet)
    end

    def decrypt(text)
      substitute(text, @cipher_alphabet, @text_alphabet)
    end

    private
    def substitute(text, source_alphabet, target_alphabet)
      source_alphabet.sanitize(text).map do |char|
        target_alphabet.char(char, source_alphabet)
      end.join
    end
  end
end
