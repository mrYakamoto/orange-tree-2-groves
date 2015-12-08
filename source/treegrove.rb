require_relative 'orange_tree'
require_relative 'apple_tree'

class TreeGrove

  def initialize(new_tree)
    @trees = []
    @trees << new_tree
  end

  def add_tree(tree)
    @trees << tree
  end

  def remove_tree(tree)
    @trees.delete(tree)
  end

  def age!
    @trees.each do |tree|
      tree.age!
    end
  end

  def trees
    return @trees
  end

  def mature_trees
    mature_trees = []
    @trees.each do |tree|
      if tree.is_a? OrangeTree && tree.has_oranges?
        mature_trees << tree
    elsif tree.is_a? AppleTree && tree.has_apples?
        mature_trees << tree
      end
    end
    return mature_trees
  end

  def dead_trees
    dead_trees = []
    @trees.each do |tree|
      dead_trees << tree if tree.dead?
    end
    return dead_trees
  end
end
