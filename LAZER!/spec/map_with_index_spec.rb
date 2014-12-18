require './lib/map_with_index'

describe 'map_with_index' do
  context 'when called on an array of strings' do
    it 'should return an array of strings with the original string and index number.' do
      array = ['Zeroth','First','Second','Third','Fourth']
      expect(array.map_with_index).to eq(["Zeroth is at location 0.", "First is at location 1.", "Second is at location 2.", "Third is at location 3.", "Fourth is at location 4."])
    end
  end
end