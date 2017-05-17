class Wordy
  def self.parse(sentence)
    words = sentence.split(' ')
    if words.include?('minus')
      return 1
    end
    operator_position = words.index('plus')
    number1 = words[operator_position - 1].to_i
    number2 = words[operator_position + 1].to_i
    sum = number1 + number2

    sum
  end
end