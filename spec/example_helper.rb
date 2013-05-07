require 'yaml'

module ExampleHelpers
  def filename_for(cipher, group)
    "#{cipher}_examples_#{group}.yaml"
  end

  def load_examples(cipher, group)
    filename = File.join(File.dirname(__FILE__), filename_for(cipher, group))
    examples = YAML.load(File.read(filename)) || []
  end
end
