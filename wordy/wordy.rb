class Wordy
  # step 1: find operator and operands
  # step 2: evaluate

  def self.parse(sentence)
    words = sentence.split(' ')
    words.reject! { |word| word == "by"}
    if words.include?('minus')
      number1, number2 = get_operands(words, 'minus')

      number1 - number2
    elsif words.include?('plus')
      number1, number2 = get_operands(words, 'plus')

      number1 + number2
    elsif words.include?('multiplied')
      number1, number2 = get_operands(words, 'multiplied')

      number1 * number2
    end
  end


  def self.get_operands(words, operator)
    operator_position = words.index(operator)
    number1 = words[operator_position - 1].to_i
    number2 = words[operator_position + 1].to_i

    return number1, number2
  end
end