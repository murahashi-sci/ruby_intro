class Calculator

  attr_accessor "input_number"
  
  # コンストラクタ
  def initialize(number)
    raise ArgumentError unless number.integer?
    @input_number = number
  end

  def calc_double
    @input_number * 2
  end
end

calculator = Calculator.new(100)
calculator.input_number = 200
puts calculator.input_number

