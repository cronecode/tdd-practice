class Wordy
  # step 1: find operator and operands
  # step 2: evaluate
  EQUATION_REGEX = /(-?\d+\s\w+(\sby)?\s-?\d+)/
  OPERATOR_REGEX = /([A-Za-z\s]+)/
  EXTRACT_NUMBERS_REGEX = /(-?\d+)[\A-Za-z+\s]+(-?\d+)/

  EQUATION_MAP = {
    'plus' => :add,
    'minus' => :subtract,
    'multiplied by' => :multiply,
    'divided by' => :divide
  }

  def self.parse(sentence)
    eq_string = equation_string(sentence)
    return extract_number(sentence) if eq_string.nil?

    operator = operator(eq_string)

    operator_message = EQUATION_MAP[operator]
    value = self.send(operator_message, *equation_numbers(eq_string))

    self.parse(next_sentence(value, sentence))
  end

  def self.extract_number(sentence)
    /-?\d+/.match(sentence)[0].to_i
  end

  def self.next_sentence(value, sentence)
    sentence.gsub(EQUATION_REGEX, value.to_s)
  end

  def self.equation_string(sentence)
    match = EQUATION_REGEX.match(sentence)
    return if match.nil?

    match[1]
  end

  def self.operator(equation_string)
    OPERATOR_REGEX.match(equation_string)[0].strip
  end

  def self.equation_numbers(equation_string)
    numbers_match = EXTRACT_NUMBERS_REGEX.match(equation_string)

    [numbers_match[1].to_i,numbers_match[2].to_i]
  end

  def self.method_missing(message, *args)
    Calculator.send(message, *args)
  end

  module Calculator
    extend self

    def add(number_1, number_2)
      number_1 + number_2
    end

    def subtract(number_1, number_2)
      number_1 - number_2
    end

    def multiply(number_1, number_2)
      number_1 * number_2
    end

    def divide(number_1, number_2)
      number_1 / number_2
    end
  end
end
