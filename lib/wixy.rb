require 'wixy/version'
require 'wixy/ciphers'
require 'wixy/vigenere'
require 'wixy/caesar'
require 'wixy/bifid'

module Wixy
  def self.encrypt(text, options = {})
    options[:cipher] ||= :caesar
    new_cipher(options).encrypt(text)
  end

  def self.decrypt(text, options = {})
    options[:cipher] ||= :caesar
    new_cipher(options).decrypt(text)
  end

  private
  def self.new_cipher(options)
    klass = options.delete(:cipher).to_s.capitalize
    self.const_get(klass).new(options)
  end
end
