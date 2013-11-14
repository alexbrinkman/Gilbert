class TennisPoint
  attr_accessor :point_number, :current_score, :fsxcoord, :fsycoord, :ssxcoord, :ssycoord,
  :player_serving, :first_serve, :second_serve, :pt_result, :pt_winnererror,
  :hit_location, :hit_side, :epxcoord, :epycoord, :spxcoord, :spycoord, :rally_count,
  :break_point, :won_by

  def generate(score, won_by)
  	@current_score = score
  	@player_serving = won_by
  	@fsxcoord = 357
  	@fsycoord = 260
  	@ssxcoord = nil
  	@ssycoord = nil
  	@hit_side = "Forehand"
		@epxcoord = 109
		@epycoord = 160
		@spxcoord = 323
		@spycoord = 887
		@rally_count = 7
		@break_point = false
		@won_by = won_by
  end

  private

  def next_score(current_score, won_by)

  	# Todo: There's got to be a better way to do this.

  	if won_by == :server
  		if current_score == "0-0"
  			return "15-0"
  		elsif current_score == "15-0"
  			return "30-0"
  		elsif current_score == "30-0"
  			return "40-0"
  		elsif current_score == "40-0"
  			return :game_over
  		elsif current_score == "0-15"
  			return "15-15"
  		elsif current_score == "15-15"
  			return "30-15"
  		elsif current_score == "30-15"
  			return "40-15"
  		elsif current_score == "40-15"
  			return :game_over
  		elsif current_score == "0-30"
  			return "15-30"
  		elsif current_score == "15-30"
  			return "30-30"
  		elsif current_score == "30-30"
  			return "40-30"
  		elsif current_score == "40-30"
  			return :game_over
  		elsif current_score == "0-40"
  			return "15-40"
  		elsif current_score == "15-40"
  			return "30-40"
  		elsif current_score == "30-40"
  			return "40-40"
  		elsif current_score == "40-40"
  			return "A-40"
  		elsif current_score == "40-A"
  			return "40-40"
  		elsif current_score == "A-40"
  			return :game_over
  		end
  	else
  		if current_score == "0-0"
  			return "0-15"
  		elsif current_score == "15-0"
  			return "15-15"
  		elsif current_score == "30-0"
  			return "30-15"
  		elsif current_score == "40-0"
  			return "40-15"
  		elsif current_score == "0-15"
  			return "0-30"
  		elsif current_score == "15-15"
  			return "15-30"
  		elsif current_score == "30-15"
  			return "30-30"
  		elsif current_score == "40-15"
  			return "40-30"
  		elsif current_score == "0-30"
  			return "0-40"
  		elsif current_score == "15-30"
  			return "15-40"
  		elsif current_score == "30-30"
  			return "30-40"
  		elsif current_score == "40-30"
  			return "40-40"
  		elsif current_score == "0-40"
  			return :game_over
  		elsif current_score == "15-40"
  			return :game_over
  		elsif current_score == "30-40"
  			return :game_over
  		elsif current_score == "40-40"
  			return "40-A"
  		elsif current_score == "40-A"
  			return :game_over
  		elsif current_score == "A-40"
  			return "40-40"
  	end
  end

end