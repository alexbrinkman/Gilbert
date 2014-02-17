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
    first_serve_coords = generate_serve
		@fsxcoord = first_serve_coords[:x]
		@fsycoord = first_serve_coords[:y]
    if serve_was_in?(@fsxcoord, @fsycoord)
		  @ssxcoord = nil
		  @ssycoord = nil
      @first_serve = generate_first_serve_result
      @second_serve = nil
    else
      second_serve_coords = generate_serve
      @ssxcoord = second_serve_coords[:x]
      @ssycoord = second_serve_coords[:y]
      @first_serve = "1st Serve Out"
      @second_serve = generate_second_serve_result
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
      "first_serve" => @first_serve,
      "second_serve" => @second_serve,
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

  private

  def generate_serve
    x = Random.rand(0..700)
    y = Random.rand(0..400)
    {x: x, y: y}
  end

  def generate_first_serve_result
    return "1st Serve Ace"
  end

  def generate_second_serve_result
    return "2nd Serve In"
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