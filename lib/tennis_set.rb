class TennisSet
  attr_accessor :set_number,
  :team_1_set_score, :team_2_set_score, :team_1_tie_breaker_score, :team_2_tie_breaker_score,
  :player_serving_first, :tennis_games_attributes

  def generate
    @set_number = 1
    @team_1_set_score = 6
    @team_2_set_score = 3
    @team_1_tie_breaker_score = nil
    @team_2_tie_breaker_score = nil
    @player_serving_first = 1
    @tennis_games_attributes = []
  end
end