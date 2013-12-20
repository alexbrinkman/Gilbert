class TennisSet
  attr_accessor :set_number,
  :team_1_set_score, :team_2_set_score, :team_1_tie_breaker_score, :team_2_tie_breaker_score,
  :player_serving_first, :tennis_games_attributes

  def initialize
    @tennis_games_attributes = []
  end

  def next_score(current_score, won_by)
    vals = current_score.split("-").map { |s| s.to_i }
    won_by == :player_won ? vals[0] += 1 : vals[1] += 1

    if vals[0] == 2
      :player_won
    elsif vals[1] == 2
      :opponent_won
    else
      "#{vals[0]}-#{vals[1]}"
    end
  end

end