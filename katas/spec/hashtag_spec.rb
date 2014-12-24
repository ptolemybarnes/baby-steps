require './lib/hashtag'

describe 'hashtag' do

  it 'should extract into an array a word from an input string that are prefixed by #' do
    expect(get_hashtags("hello #world")).to eq(['world'])
  end

  it 'should extract multiple words' do
    expect(get_hashtags("This is the #voice of the #mysterons")).to eq(['voice', 'mysterons'])
    expect(get_hashtags('#lol #sorryNotSorry #hey #coolbeans')).to eq(['lol', 'sorryNotSorry', 'hey', 'coolbeans'])
  end

  it 'should not register hashtags in the middle of words' do
    expect(get_hashtags("in#line")).to eq([])
  end

  it 'should register hashtag-prefixed words at the start of a sentence' do
    expect(get_hashtags('#greetings Earthlings, take me to your #leader')).to eq(['greetings', 'leader'])
  end

  it 'should not capture first word in a string of hashtag prefixed words without spaces' do
    expect(get_hashtags('#red#blue#yellow#green')).to eq([])
  end

  it 'should capture hashtag-prefixed word at the end of the string' do
    expect(get_hashtags('#red#blue#yellow #green')).to eq ['green']
  end

  it 'should not extract white spaces prefixed by hashtags' do
    expect(get_hashtags("# # # #")).to eq([])
  end

  it 'should capture words prefixed by multiple hashes' do
  expect(get_hashtags("####many #single")).to eq(['many', 'single'])
  end

  it 'should not capture words that dont begin within an alphabet character' do
    expect(get_hashtags('#$dollars #pound')).to eq(['pound'])

  end

end