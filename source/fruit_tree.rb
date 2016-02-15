# This is how you define your own custom exception classes
class NoFruitError < StandardError; end
class TreeDeadError < StandardError; end


class FruitTree
  attr_reader :height, :age

  def initialize(height = 0, age = 0)
    @age = age
    @height = height
  end

  def dead?
    @age >= 70
  end
end

class Fruit
  attr_reader :diameter

  # Initializes a new fruit with diameter +diameter+
  def initialize( diameter = rand(2.0..3.0).round(2) )
    @diameter = diameter
  end
end
