require './lib/flattenedkeys'

describe 'flattenedkeys' do

  it 'can flatten keys with a single nested hash' do
    expect({id: 1, info: {name: 'example'}}.flattened_keys).to eq({id: 1, info_name: 'example'})
  end

  it 'can flatten keys with two levels of nesting' do
    unflat = {:id=>1, :info=>{:name=>"example", :more_info=>{:count=>1}}}
    expect(unflat.flattened_keys).to eq({id: 1, info_name: 'example', info_more_info_count: 1})
  end

  describe 'flattened_keys' do

    it 'can concetenate parent key and single child key' do
      expect({id: {name: 'example'}}.flattened_keys).to eq({id_name: 'example'})
    end

    it 'can concetenate a parent key and multiple child keys' do
      expect({id: {name: 'example', type: 'example_type'}}.flattened_keys).to eq({id_name: 'example', id_type: 'example_type'})
    end

  end
end 