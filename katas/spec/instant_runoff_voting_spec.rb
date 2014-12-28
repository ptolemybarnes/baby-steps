require './lib/instant_runoff_voting'

describe 'instant_runoff_voting' do

  second_round_voters = [[:ind],
                        [:ind],
                        [:ind],
                        [:ind]]

  no_winner_votes = [[:dem, :ind, :rep],
                    [:ind, :rep, :dem],
                    [:rep, :dem, :ind]]

  it 'returns the leading votes' do
    expect(get_leading_votes_from(voters_helper)).to eq([:dem,:rep,:ind,:ind])
  end

  it 'can calculate the winner' do
    expect(runoff(voters_helper)).to eq(:ind)
  end

  it 'returns nil if there is no winner' do
    expect(runoff(no_winner_votes)).to eq(nil)
  end

  it 'can return the winner of a round' do
    expect(who_has_most([:ind,:ind,:ind,:rep])).to eq(:ind)
  end

  it 'returns true if winner has over 50%' do
    expect(is_winner?(:ind, [:ind,:ind,:ind,:rep])).to eq(true)
  end

  it 'returns false if winner does not have more than 50%' do
    expect(is_winner?(:ind, [:ind,:dem,:ind,:rep])).to eq(false)
  end

  # describe 'returns candidate(s) with least votes' do
    
  #   it 'when there is a single candidate' do
  #     votes = [:ind,:ind,:ind,:rep]
  #     expect(who_has_least(votes, votes.uniq)).to eq([:rep])
  #   end

  #   it 'when candidates tie for least votes' do
  #     votes = [:ind,:dem,:ind,:rep]
  #     expect(who_has_least(votes, votes.uniq)).to eq([:dem, :rep])
  #   end

  #   it 'returns an empty array if they are all equally bad' do
  #     votes = [:dem,:ind,:rep]
  #     expect(who_has_least(votes,)).to eq([])
  #   end
  # end

  it 'can remove the losing votes from voting card' do
    expect(next_round(voters_helper,[:dem, :rep])).to eq(second_round_voters)
  end

  describe 'get_candidates_hash' do
    it 'can generate a hash for counting votes from the voters array' do
      expect(get_candidates_hash(voters_helper)).to eq({:dem=>0, :ind=>0, :rep=>0})
    end
  end
end

def voters_helper
voters = [[:dem, :ind, :rep],
           [:rep, :ind, :dem],
           [:ind, :dem, :rep],
           [:ind, :rep, :dem]]
end