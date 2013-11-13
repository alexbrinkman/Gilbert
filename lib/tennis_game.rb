class TennisGame
  attr_accessor :game_number, :game_notes, :tennis_points_attributes

  def generate
  	@game_number = 1
  	@game_notes = "Wow, what a game!"
  	@tennis_points_attributes = []
  end
end