class TennisPoint
	attr_accessor :point_number, :current_score, :fsxcoord, :fsycoord, :ssxcoord, :ssycoord,
	:player_serving, :first_serve, :second_serve, :pt_result, :pt_winnererror,
	:hit_location, :hit_side, :epxcoord, :epycoord, :spxcoord, :spycoord, :rally_count,
	:break_point, :won_by

  def initialize(fsp, ssp, fspw, sspw)
    @first_serve_percentage = fsp
    @second_serve_percentage = ssp
    @first_serve_points_won = fspw
    @second_serve_points_won = sspw
  end

	def generate
    first_serve = generate_serve
		@fsxcoord = first_serve[:x]
		@fsycoord = first_serve[:y]
    if serve_was_in?(@fsxcoord, @fsycoord)
		  @ssxcoord = nil
		  @ssycoord = nil
    else
      second_serve = generate_serve
      @ssxcoord = second_serve[:x]
      @ssycoord = second_serve[:y]
    end
		@hit_side = "Forehand"
		@epxcoord = 109
		@epycoord = 160
		@spxcoord = 323
		@spycoord = 887
		@rally_count = generate_rally_count
		@break_point = false
    @won_by = generate_who_won_point
	end

  # If I don't provide this, the init vars get into the json too.
  def as_json options={}
    {
      "point_number" => @point_number,
      "current_score" => @current_score,
      "player_serving" => @player_serving,
      "fsxcoord" => @fsxcoord,
      "fsycoord" => @fsycoord,
      "ssxcoord" => @ssxcoord,
      "ssycoord" => @ssycoord,
      "hit_side" => @hit_side,
      "epxcoord" => @epxcoord,
      "epycoord" => @epycoord,
      "spxcoord" => @spxcoord,
      "spycoord" => @spycoord,
      "rally_count" => @rally_count,
      "break_point" => @break_point,
      "won_by" => @won_by
    }
  end

	def next_score(current_score, won_by)

  	# Todo: There's got to be a better way to do this.

  	if won_by == 1
  		if current_score == "0-0"
  			return "15-0"
  		elsif current_score == "15-0"
  			return "30-0"
  		elsif current_score == "30-0"
  			return "40-0"
  		elsif current_score == "40-0"
  			return :server_won
  		elsif current_score == "0-15"
  			return "15-15"
  		elsif current_score == "15-15"
  			return "30-15"
  		elsif current_score == "30-15"
  			return "40-15"
  		elsif current_score == "40-15"
  			return :server_won
  		elsif current_score == "0-30"
  			return "15-30"
  		elsif current_score == "15-30"
  			return "30-30"
  		elsif current_score == "30-30"
  			return "40-30"
  		elsif current_score == "40-30"
  			return :server_won
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
  			return :server_won
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
  			return :returner_won
  		elsif current_score == "15-40"
  			return :returner_won
  		elsif current_score == "30-40"
  			return :returner_won
  		elsif current_score == "40-40"
  			return "40-A"
  		elsif current_score == "40-A"
  			return :returner_won
  		elsif current_score == "A-40"
  			return "40-40"
  		end
  	end
  end

  private

  def generate_serve
    x = Random.rand(0..700)
    y = Random.rand(0..400)
    {x: x, y: y}
  end

  def serve_was_in?(x,y)
    x < 350 && y < 200
  end

  def generate_who_won_point
    @first_serve_points_won >= Random.rand(0..100) ? 1 : 2
  end

  def generate_rally_count
    Random.rand(1..15)
  end

end