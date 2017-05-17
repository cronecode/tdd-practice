require 'rspec'
require './wordy'

#Arrange, Act, Assert

describe Wordy do
  describe '#parse' do
    it "adds two positive numbers" do
      sentence = "What is 6 plus 14?"

      result = Wordy.parse(sentence)

      expect(result).to eq(20)
    end

    xit "adds two negative numbers" do
      sentence = "What is -6 plus -14?"

      result = Wordy.parse(sentence)

      expect(result).to eq(-20)
    end

    xit "subtracts two positive numbers" do
      sentence = "What is 3 minus 2?"
      
      result = Wordy.parse(sentence)

      expect(result).to eq(1)
    end

    xit "multiplies two numbers" do
       sentence = "What is 2 multiplied by 4?"

       result = Wordy.parse(sentence)

       expect(result).to eq(8)
    end

    xit "divides two numbers" do
      sentence = "What is 10 divided by 5?"

      result = Wordy.parse(sentence)

      expect(result).to eq(2)
    end

    xit "evaluates multiple operations" do
      sentence = "What is 5 plus 13 plus 6?"

      result = Wordy.parse(sentence)

      expect(result).to eq(24)
    end
  end
end
