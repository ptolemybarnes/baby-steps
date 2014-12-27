require './lib/ips_between'

describe 'ips_between' do

it 'returns total ips between two ips' do
  expect(ipsBetween("10.0.0.0", "10.0.0.50")).to eq(50)
  expect(ipsBetween("10.0.0.0", "10.0.1.0")).to eq(256)
  expect(ipsBetween("20.0.0.10", "20.0.1.0")).to eq(246)
end

it 'returns the total value of an ip' do
  expect(get_ip_value("10.0.0.0")).to eq(167772160)


end




end