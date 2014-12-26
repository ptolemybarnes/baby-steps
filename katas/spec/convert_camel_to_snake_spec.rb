require './lib/convert_camel_to_snake'

describe 'to_underscore' do

  it 'can convert_camel_to_snake' do
    expect(camel_to_snake('CamelCase')).to eq('camel_case')
  end

  it 'can deal with numbers' do
    expect(camel_to_snake(1)).to eq('1')
  end

end