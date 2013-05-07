require 'example_helper'
require 'caesar'

describe "Caesar" do
  extend ExampleHelpers

  describe "#encrypt" do
    load_examples("caesar", "encrypt").each do |example|
      describe "'#{example['cleartext']}'" do
        let(:caesar) { Caesar.new(example["shift"]) }
        it "produces '#{example['ciphertext']}'" do
          result = caesar.encrypt example["cleartext"]
          expect(result).to eq(example["ciphertext"])
        end
      end
    end
  end
end
