require_relative 'orange_tree'

#Only run this _after_ your implementation and tests are complete

tree = OrangeTree.new

tree.age! until tree.has_oranges?

puts "Tree is #{tree.age} years old and #{tree.height} feet tall"

until tree.dead?
  basket = []

  while tree.has_oranges?
    basket << tree.pick_an_orange!
  end

  total_diameter = 0
  basket.each do |orange|
    total_diameter += orange.diameter
  end
  avg_diameter = (total_diameter / basket.length).round(2)

  puts "Year #{tree.age} Report"
  puts "Tree height: #{tree.height} feet"
  puts "Harvest:     #{basket.size} oranges with an average diameter of #{avg_diameter} inches"
  puts ""

  # Age the tree another year
  tree.age!
end

puts "Alas, the tree, she is dead!"
