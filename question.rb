class Question
  attr_reader :answer, :question

  def initialize
    num1 = rand(1..10)
    num2 = rand(1..10)
    @question = "What does #{num1} plus #{num2} equal?"
    @answer = num1 + num2
  end
end 
