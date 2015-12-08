require_relative 'fruit_tree'

# This is how you define your own custom exception classes
class NoApplesError < StandardError; end
class TreeDeadError < StandardError; end


class AppleTree < FruitTree
  attr_reader :height, :age

  def initialize(height = 0, age = 0)
    @age = age
    @height = height
    @apples_to_pick = 0
  end
  # Ages the tree one year
  def age!
    raise TreeDeadError, "This tree is dead, yo! D:" unless @age < 70
    @age += 1 if @age < 70
    @height += 7 if @age < 40
    @apples_to_pick += 15 if @age >= 8
    return @age
  end

  # Returns +true+ if there are any apples on the tree, +false+ otherwise
  def has_apples?
    @age >= 8 && @apples_to_pick > 0
  end

  # Returns an apple if there are any
  # Raises a NoApplesError otherwise
  def pick_an_apple!
    raise NoApplesError, "This tree has no apples" unless self.has_apples?
    # apple-picking logic goes here
    @apples_to_pick -= 1
    return Apple.new
  end
end

class Apple < Fruit
  attr_reader :diameter

  # Initializes a new Apple with diameter +diameter+
  def initialize( diameter = rand(2.0..3.0).round(2) )
    @diameter = diameter
  end
end
