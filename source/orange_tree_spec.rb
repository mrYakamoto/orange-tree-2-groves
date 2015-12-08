require_relative 'orange_tree'

describe OrangeTree do
  let(:tree) { OrangeTree.new }

  #You'll need to switch `pending` to `describe` when you're ready
  # to implement each set of tests.

  describe '#age' do
    it "returns tree's initialized" do
      expect(tree.age).to eq(0)
    end
    it "returns tree's age after aging" do
      expect(tree.age!).to eq(1)
    end
  end

  describe '#height' do
    it "returns tree's initialized height" do
      expect(tree.height).to eq(0)
    end
    it "returns tree's height after aging" do
      tree.age!
      expect(tree.height).to eq(7)
    end
  end


  describe '#age!' do
    it 'should change the age' do
      #This should be more explicit. How much should the tree age by?
      #https://www.relishapp.com/rspec/rspec-expectations/v/2-0/docs/matchers/expect-change
      expect{tree.age!}.to change{tree.age}.by(1)
    end

    it 'should make the tree grow' do
      #This should be more explicit. How much should the tree grow?
      expect{tree.age!}.to change{tree.height}.by(7)
    end

    it 'should cause the tree to eventually die' do
      70.times { tree.age! }
      expect{tree.age!}.to raise_error(StandardError)
    end
  end

  describe '#dead?' do
    it 'should return false for an alive tree' do
      expect(tree.dead?).to be false
    end

    it 'should return true for a dead tree' do
      70.times { tree.age! }
      expect(tree.dead?).to be true
    end
  end

  describe '#has_oranges?' do
    it 'should return true if oranges are on the tree' do
      10.times { tree.age! }
      expect(tree.has_oranges?).to be true
    end

    it 'should return false if the tree has no oranges' do
      expect(tree.has_oranges?).to be false
    end
  end

  describe '#pick_an_orange' do
    it 'should return an orange from the tree' do
      10.times { tree.age! }
      expect(tree.pick_an_orange!).to be_a Orange
    end
  end
end
