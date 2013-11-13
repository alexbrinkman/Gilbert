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

end