require 'wixy/vigenere'
require 'example_helper'

include Wixy

describe "Vigenere" do
  extend ExampleHelpers

  describe "#encrypt" do
    load_examples("vigenere", "encrypt").each do |example|
      describe "'#{example['cleartext']}'" do
        let(:config) {
          ::Wixy::Config.new do |config|
            config.key = example['key']
          end
        }
        let(:vigenere) { Vigenere.new(config) }
        it "produces '#{example['ciphertext']}'" do
          result = vigenere.encrypt example["cleartext"]
          expect(result).to eq(example["ciphertext"])
        end
      end
    end
  end
end
