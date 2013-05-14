require 'example_helper'
require 'wixy/caesar'

include Wixy

describe "Caesar" do
  extend ExampleHelpers

  describe "#encrypt" do
    load_examples("caesar", "encrypt", "discard").each do |example|
      describe "'#{example['cleartext']}'" do
        let(:config) { {shift: example["shift"]} }
        let(:caesar) { Caesar.new(config) }
        it "produces '#{example['ciphertext']}'" do
          result = caesar.encrypt example["cleartext"]
          expect(result).to eq(example["ciphertext"])
        end
      end
    end
  end
end
