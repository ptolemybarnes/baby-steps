=begin 
Your task is to implement a function that calculates an election winner from a list of 
voter selections using an Instant Runoff Voting algorithm:

1) Each voter selects several candidates in order of preference.
2) The votes are tallied from the each voter's first choice.
3) If the first-place candidate has more than half the total votes, they win.
4) Otherwise, find the candidate who got the least votes and remove them from each person's voting list.
5) In case of a tie for least, remove all of the tying candidates.
6) In case of a complete tie between every candidate, return nil.
7) Start over.
8) Continue until somebody has more than half the votes; they are the winner.
Your function will be given a list of voter ballots; each ballot will be a list of candidates (symbols) in descending order of preference. You should return the symbol corresponding to the winning candidate. See the default test for an example
=end

def runoff voters
  votes             = get_leading_votes_from(voters)
  leading_candidate = who_has_most votes
  return leading_candidate if is_winner?(leading_candidate, votes)
  losers = who_has_least(votes, get_candidates_hash(voters))
  return nil if losers.empty?
  runoff(next_round(voters,losers))
end

def get_leading_votes_from voters
  voters.map {|votes| votes[0] }
end

def who_has_most votes
  votes.max_by{|x| votes.count(x) }
end

def is_winner? candidate, votes 
  votes.count(candidate) / votes.size.to_f > 0.5
end

# problem: returns all candidates if they are all equally bad, resulting in them all being eliminated.
def who_has_least votes, counts
  votes.each {|vote| counts[vote] += 1}
  lowest_count = counts.values.min_by {|count| count }
  losers       = counts.keys.select {|party| counts[party] == lowest_count }
  losers.size == votes.size ? [] : losers
end

def get_candidates_hash voters
  vote_count = Hash.new
  voters.flatten.uniq.each {|candidate| vote_count[candidate] = 0 }
  vote_count
end

def next_round voters, losers
  losers.each do |loser|
      voters.each {|vote_card| vote_card.delete(loser)}
  end
  voters
end







