require_relative 'fruit_tree'

# This is how you define your own custom exception classes
class NoOrangesError < StandardError; end
class TreeDeadError < StandardError; end


class OrangeTree < FruitTree
  attr_reader :height, :age

  def initialize(height = 0, age = 0)
    @age = age
    @height = height
    @oranges_to_pick = 0
  end
  # Ages the tree one year
  def age!
    raise TreeDeadError, "This tree is dead, yo! D:" unless @age < 70
    @age += 1 if @age < 70
    @height += 7 if @age < 40
    @oranges_to_pick += 10 if @age >= 10
    return @age
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
    @age >= 10 && @oranges_to_pick > 0
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange!
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?
    # orange-picking logic goes here
    @oranges_to_pick -= 1
    return Orange.new
  end
end

class Orange < Fruit
  attr_reader :diameter

  # Initializes a new Orange with diameter +diameter+
  def initialize( diameter = rand(3.0..4.0).round(2) )
    @diameter = diameter
  end
end
