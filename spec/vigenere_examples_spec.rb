require 'vigenere'
require 'yaml'

module ExampleHelpers
  def load_examples(group)
    examples = YAML.load(File.read(File.join(File.dirname(__FILE__), 'vigenere_examples.yaml')))
    puts examples
    examples[group.to_s]
  end
end

describe "Vigenere" do

  describe "basic" do
    extend ExampleHelpers

    load_examples("basic").each do |example|
      let(:vigenere) { Vigenere.new(example["key"]) }
      it "converts from '#{example['cleartext']}' to '#{example['ciphertext']}'" do
        expect(vigenere.encrypt example["cleartext"]).to eq(example["ciphertext"])
      end
    end
  end
end
