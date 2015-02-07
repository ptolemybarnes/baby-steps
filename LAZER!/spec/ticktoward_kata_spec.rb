require './lib/ticktoward_kata'

describe 'Integer#tickto' do

  it 'increases integer by one toward another' do
    expect(1.ticktoward(2)).to eq(2)
    expect(3.ticktoward(3)).to eq(3)
    expect(5.ticktoward(1)).to eq(4)
    expect(0.ticktoward(-2)).to eq(-1)
  end
end

describe 'ticktoward' do

  it 'gets medial values between two positive x_y coords' do
    expect(ticktoward([2,2],[4,2])).to eq([[2,2],[3,2],[4,2]])
    expect(ticktoward([3,2],[5,5])).to eq([[3,2],[4,3],[5,4],[5,5]])
    expect(ticktoward([3,2],[5,5])).to eq([[3,2],[4,3],[5,4],[5,5]])
  end

  it 'gets medial values when start and target contain negative values' do
    expect(ticktoward([-1,2],[2,2])).to eq([[-1,2],[0,2],[1,2],[2,2]])
    expect(ticktoward([-1,-1],[-2,-3])).to eq([[-1,-1],[-2,-2],[-2,-3]])
  end

  it 'returns single coordinate if start and target are the same' do
    expect(ticktoward([0,0],[0,0])).to eq([[0,0]])
  end

  it 'returns start and target if only single difference' do
    expect(ticktoward([0,0],[1,1])).to eq([[0,0],[1,1]])
  end
end