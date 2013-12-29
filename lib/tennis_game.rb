class TennisGame
  attr_accessor :game_number, :game_notes, :tennis_points_attributes

  def initialize
		@game_notes = "Wow, what a game!"
		@tennis_points_attributes = []
  end

  def next_score(current_score, won_by)
  	vals = current_score[:note].split("-").map { |s| s.to_i }
  	won_by == :server_won ? vals[0] += 1 : vals[1] += 1

  	if (vals[0] == 6 && vals[1] < 5) || vals[0] == 7
  		note = :player_won
  	elsif (vals[1] == 6 && vals[0] < 5) || vals[1] == 7
  		note = :opponent_won
  	else
	  	note = "#{vals[0]}-#{vals[1]}"
	  end

	  {server_score: vals[0], returner_score: vals[1], note: note}

  end

end