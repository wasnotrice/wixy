require 'wixy/vigenere'
require 'example_helper'

include Wixy

describe "Vigenere" do
  extend ExampleHelpers

  load_examples("vigenere", "encrypt").each do |e|
    describe "'#{e['cleartext']}' <-> '#{e['ciphertext']}'" do
      let(:config) {
        ::Wixy::Config.new do |config|
          config.key = e['key']
        end
      }
      let(:cleartext) { e['cleartext'] }
      let(:ciphertext) { e['ciphertext'] }
      let(:vigenere) { Vigenere.new(config) }

      it "encrypts" do
        result = vigenere.encrypt e['cleartext']
        expect(result).to eq(e['ciphertext'])
      end

      it "decrypts" do
        result = vigenere.decrypt e['ciphertext']
        expect(result).to eq(e['cleartext'])
      end
    end
  end
end
