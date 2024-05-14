class Question
  attr_reader :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def ask
    "What does #{@num1} + #{@num2} equal?"
  end

  def correct_answer
    @num1 + @num2
  end
end