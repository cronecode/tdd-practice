require 'rspec'
require './wordy'

#Arrange, Act, Assert

describe Wordy do
  describe '#parse' do
    it "adds two numbers together" do
      sentence = "What is 6 plus 14?"

      result = Wordy.parse(sentence)

      expect(result).to eq(20)
    end
  end
end