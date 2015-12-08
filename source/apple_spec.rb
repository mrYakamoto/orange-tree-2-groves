require_relative 'apple_tree'

describe Apple do
  let(:apple) { Apple.new }
  it 'creates a new apple with a diameter between 2.0 and 3.0' do
    expect(apple.diameter).to be_a(Float)
    expect(apple.diameter).to be > 2.0
    expect(apple.diameter).to be < 3.0
  end
end
