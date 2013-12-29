class TennisSet
  attr_accessor :set_number,
  :team_1_set_score, :team_2_set_score, :team_1_tie_breaker_score, :team_2_tie_breaker_score,
  :player_serving_first, :tennis_games_attributes

  def initialize
    @tennis_games_attributes = []
  end

  def next_score(current_score, won_by)
    vals = current_score[:note].split("-").map { |s| s.to_i }
    won_by == :player_won ? vals[0] += 1 : vals[1] += 1

    if vals[0] == 2
      note = :player_won
    elsif vals[1] == 2
      note = :opponent_won
    else
      note = "#{vals[0]}-#{vals[1]}"
    end

    {player_score: vals[0], opponent_score: vals[1], note: note}

  end

end