require 'wixy/vigenere'
require 'example_helper'

module ConfigHelpers
  def create_config(options)
    Wixy::Config.new do |config|
      options.each do |key, value|
        config.public_send("#{key}=", value)
      end
    end
  end
end

include Wixy

describe "Vigenere" do
  extend ExampleHelpers
  include ConfigHelpers

  load_examples("vigenere", "encrypt", "discard").each do |e|
    describe "'#{e['cleartext']}' -> '#{e['ciphertext']}'" do
      let(:config) { create_config(:key => e['key']) }
      let(:cleartext) { e['cleartext'] }
      let(:ciphertext) { e['ciphertext'] }
      let(:vigenere) { Vigenere.new(config) }

      it "encrypts" do
        result = vigenere.encrypt e['cleartext']
        expect(result).to eq(e['ciphertext'])
      end
    end
  end

  load_examples("vigenere", "encrypt", "preserve").each do |e|
    describe "'#{e['cleartext']}' -> '#{e['ciphertext']}'" do
      let(:config) { create_config(:key => e['key'], :preserve => true) }
      let(:cleartext) { e['cleartext'] }
      let(:ciphertext) { e['ciphertext'] }
      let(:vigenere) { Vigenere.new(config) }

      it "encrypts" do
        result = vigenere.encrypt e['cleartext']
        expect(result).to eq(e['ciphertext'])
      end
    end
  end
end
