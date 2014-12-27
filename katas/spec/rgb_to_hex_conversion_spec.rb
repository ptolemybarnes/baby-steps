require './lib/rgb_to_hex_conversion'

describe 'RGB to Hex' do

  describe 'rgb' do

    it 'can convert an rgb value to hex' do
      expect(rgb(255, 255, 255)).to eq('FFFFFF')
      expect(rgb(255, 255, 300)).to eq('FFFFFF')
      expect(rgb(  0,   0,   0)).to eq('000000')
      expect(rgb(148,   0, 211)).to eq('9400D3')
    end
  end

  describe 'get_hex' do

    it 'can convert a two-digit number to a hex digit value' do
      expect(get_hex(145)).to eq('91')
    end

    it 'can convert a two-digit number to alphanumeric hex value' do
      expect(get_hex(210)).to eq('D2')
    end

    it 'can convert a single digit number' do
      expect(get_hex(1)).to eq('01')
    end

    it 'can convert a single digit number to alphabetical hex value' do
      expect(get_hex(15)).to eq('0F')
    end

    it 'should round numbers above 255 to 255' do
      expect(get_hex(300)).to eq('FF')
    end

    it 'should round negative numbers to 0' do
      expect(get_hex(-20)).to eq('00')
    end
  end


end