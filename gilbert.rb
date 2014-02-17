require './lib/match'
require './lib/tennis_set'
require './lib/tennis_game'
require './lib/tennis_point'
require './lib/score_board'
require './lib/file_writer'
require 'rubygems'
require 'active_support/all'
require 'ruby-debug'
require 'yaml'

config = YAML.load_file("config/config.yml")
score_board = ScoreBoard.new
match = Match.new

match_score = {player_score: 0, opponent_score: 0, note: "0-0"}
set_number = 1
server = :player

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
			point = TennisPoint.new(config)
			point.generate

			point.player_serving = 1
			point.current_score = game_score
			point.point_number = point_number
			point.player_serving = server == :player ? 1 : 2
			game.tennis_points_attributes.push(point)
			game_score = score_board.next_score(game_score, point.won_by)
			point_number += 1
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

FileWriter.create(match)