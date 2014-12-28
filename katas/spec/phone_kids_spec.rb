require './lib/phone_kids'

describe 'phone kids' do

  it 'can print a list of descendants' do
    expect(Mother.phone_kids).to eq("GrandChild, Son, Daughter")
  end
end