module Wixy
  class Config
    attr_accessor :cipher
    attr_accessor :key
    attr_accessor :shift
    attr_reader :ciphers

    def initialize
      @ciphers = Ciphers.new
      @cipher = @ciphers[:caesar]
      @shift = 3
      @key = "FORTIFICATION"
      yield self if block_given?
    end

    def cipher=c
      unless ciphers.cipher?(c)
        raise "Unknown cipher: #{c}. Choose from: #{ciphers.names.map(&:to_s).join(',')}"
      end
      @cipher = ciphers[c]
    end

    def shift=s
      @shift = s.to_i
    end

    class Ciphers
      CIPHERS = [:caesar, :vigenere]

      def [](name)
        ciphers.select {|c| c == name}.first
      end

      def cipher?(name)
        ciphers.include? name
      end

      def names
        ciphers.map { |c| name(c)}
      end

      def klass(name)
        "::Wixy::#{name.to_s.capitalize}"
      end

      def name(klass)
        klass.to_s.split("::").last.downcase.to_sym
      end

      def ciphers
        CIPHERS
      end
    end
  end
end
