require 'vigenere'
require 'example_helper'

describe "Vigenere" do
  extend ExampleHelpers

  describe "#encrypt" do
    load_examples("vigenere", "encrypt").each do |example|
      describe "'#{example['cleartext']}'" do
        let(:vigenere) { Vigenere.new(example["key"]) }
        it "produces '#{example['ciphertext']}'" do
          result = vigenere.encrypt example["cleartext"]
          expect(result).to eq(example["ciphertext"])
        end
      end
    end
  end
end
