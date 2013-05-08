require 'example_helper'
require 'wixy/caesar'

include Wixy

describe "Caesar" do
  extend ExampleHelpers

  describe "#encrypt" do
    load_examples("caesar", "encrypt").each do |example|
      describe "'#{example['cleartext']}'" do
        let(:config) {
          ::Wixy::Config.new do |config|
            config.shift = example["shift"]
          end
        }
        let(:caesar) { Caesar.new(config) }
        it "produces '#{example['ciphertext']}'" do
          result = caesar.encrypt example["cleartext"]
          expect(result).to eq(example["ciphertext"])
        end
      end
    end
  end
end
