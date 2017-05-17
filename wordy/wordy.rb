class Wordy
  # step 1: find operator and operands
  # step 2: evaluate
  EQUATION_REGEX = /(-?\d+\s\w+(\sby)?\s-?\d+)(.*)/
  OPERATOR_REGEX = /([A-Za-z]+)/
  EXTRACT_NUMBERS_REGEX = /(-?\d+)\s\w+\s(-?\d+)/

  EQUATION_MAP = {
    'plus' => :add
  }

  def self.parse(sentence)
    eq_string = equation_string(sentence)
    operator = operator(eq_string)

    operator_message = EQUATION_MAP[operator]
    self.send(operator_message, *equation_numbers(eq_string))
  end

  def self.add(number_1, number_2)
    number_1 + number_2
  end

  def self.equation_string(sentence)
    EQUATION_REGEX.match(sentence)[0]
  end

  def self.operator(equation_string)
    OPERATOR_REGEX.match(equation_string)[0]
  end

  def self.equation_numbers(equation_string)
    numbers_match = EXTRACT_NUMBERS_REGEX.match(equation_string)

    [numbers_match[1].to_i,numbers_match[2].to_i]
  end
end
