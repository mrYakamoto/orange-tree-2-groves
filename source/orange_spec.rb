require_relative 'orange_tree'

describe Orange do
  let(:orange) { Orange.new }
  it 'creates a new orange with a diameter between 3.0 and 4.0' do
    expect(orange.diameter).to be_a(Float)
    expect(orange.diameter).to be > 3.0
    expect(orange.diameter).to be < 4.0
  end
end
