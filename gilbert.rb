require './lib/match'
require './lib/tennis_set'
require './lib/tennis_game'
require './lib/tennis_point'
require 'rubygems'
require 'active_support/all'
require 'ruby-debug'

first_serve_percentage = 60
second_serve_percentage = 85
first_serve_points_won = 10
second_serve_points_won = 40

opponent_first_serve_percentage = 40
opponent_second_serve_percentage = 90
opponent_first_serve_points_won = 65
opponent_second_serve_points_won = 30

server = :player

match = Match.new

match_score = {player_score: 0, opponent_score: 0, note: "0-0"}
set_number = 1

while match_score[:note] != :player_won && match_score[:note] != :opponent_won do

	set = TennisSet.new
	set_score = {player_score: 0, opponent_score: 0, note: "0-0"}
	set.set_number = set_number
	game_number = 1

	while set_score[:note] != :player_won && set_score[:note] != :opponent_won do

		game = TennisGame.new
		game_score = "0-0"
		game.game_number = game_number
		point_number = 1

		while game_score != :server_won && game_score != :returner_won do
			point = TennisPoint.new(first_serve_percentage, second_serve_percentage,
				first_serve_points_won, second_serve_points_won)
			point.generate

			point.player_serving = 1
			point.current_score = game_score
			point.point_number = point_number
			point.player_serving = server == :player ? 1 : 2
			game.tennis_points_attributes.push(point)
			game_score = point.next_score(game_score, point.won_by)
			point_number +=1
		end

		set.tennis_games_attributes.push(game)
		set_score = game.next_score(set_score, game_score)
		game_number += 1
		server = server == :player ? :opponent : :player

	end

	set.team_1_set_score = set_score[:server_score]
	set.team_2_set_score = set_score[:returner_score]
	match.tennis_sets_attributes.push(set)
	match_score = set.next_score(match_score, set_score)
	set_number += 1

end

match.number_of_sets = set_number

folder_name = "matches/"
file_name = folder_name + match.event_name + DateTime.now.strftime("%Y%m%d%H%M%S") + ".json"
File.open(file_name, 'w') { |file| file.write(match.to_json) }

puts "Match JSON created successfully."