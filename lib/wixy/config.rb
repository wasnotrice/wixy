module Wixy
  class Config
    attr_accessor :cipher
    attr_accessor :shift
    attr_reader :ciphers

    def initialize
      @ciphers = Ciphers.new
      @shift = 3
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
      def [](name)
        Wixy::CIPHERS.select {|c| name(c) == name}.first
      end

      def cipher?(name)
        names.include? name
      end

      def names
        Wixy::CIPHERS.map { |c| name(c)}
      end

      def name(klass)
        klass.to_s.split("::").last.downcase.to_sym
      end
    end
  end
end
