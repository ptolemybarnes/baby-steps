require './lib/calculating_with_functions'

describe 'plus' do

  it 'returns a proc that can add two numebers together' do
    test = Proc.new do |leftop| 
            leftop + 2
          end

    expect(plus(two).call(3)).to eq(test.call(3))
  end

end

describe 'minus' do

  it 'returns a proc that can subtract one number from another' do
    test = Proc.new do |leftop| 
            leftop - 2
          end

    expect(minus(two).call(3)).to eq(test.call(3))
  end
end

describe 'times' do

  it 'returns a proc that can multiply one number by another' do
    test = Proc.new do |leftop| 
            leftop * 2
          end

    expect(times(two).call(3)).to eq(test.call(3))
  end
end

describe 'one' do
  
  it 'can add itself to another number using plus method' do
    expect(one(plus(two))).to eq(3)
  end
  
  it 'can subtract another number from itself' do
    expect(one(minus(two))).to eq(-1)
  end

  it 'can produce floats' do
    expect(two(divided_by(seven))).to eq(0.2857142857142857)
  end
end

describe 'two' do
  it 'can add itself to another number using plus method' do
    expect(two(plus(one))).to eq(3)
  end
end

