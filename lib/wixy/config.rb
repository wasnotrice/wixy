module Wixy
  class Config
    attr_accessor :cipher
    attr_accessor :key
    attr_accessor :shift
    attr_accessor :preserve

    def initialize
      @cipher = :caesar
      @shift = 3
      @key = "FORTIFICATION"
      @preserve = false
      yield self if block_given?
    end

    def cipher=(name)
      c = name.to_sym
      unless cipher?(c)
        raise "Unknown cipher: #{name}. Choose from: #{ciphers.join(', ')}"
      end
      @cipher = c
    end

    def shift=s
      @shift = s.to_i
    end

    def cipher?(name)
      ciphers.include? name.to_sym
    end

    # An array of available ciphers
    def ciphers
      [:caesar, :vigenere]
    end
  end
end
