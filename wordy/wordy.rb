class Wordy
  # step 1: find operator and operands
  # step 2: evaluate

  def self.parse(sentence)
    words = sentence.split(' ')
    if words.include?('minus')
      operator_position = words.index('minus')
      number1 = words[operator_position - 1].to_i
      number2 = words[operator_position + 1].to_i

      number1 - number2
    else
      operator_position = words.index('plus')
      number1 = words[operator_position - 1].to_i
      number2 = words[operator_position + 1].to_i

      number1 + number2
    end

  end
end