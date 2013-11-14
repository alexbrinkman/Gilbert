require './lib/match'
require './lib/tennis_set'
require './lib/tennis_game'
require './lib/tennis_point'
require 'rubygems'
require 'active_support/all'

first_serve_percentage = 60
second_serve_percentage = 85
first_serve_points_won = 70
second_serve_points_won = 40

opponent_first_serve_percentage = 40
opponent_second_serve_percentage = 90
opponent_first_serve_points_won = 65
opponent_second_serve_points_won = 30

match = Match.new
match.generate

set1 = TennisSet.new
set1.generate

game1 = TennisGame.new
game1.generate
game2 = TennisGame.new
game2.generate
game3 = TennisGame.new
game3.generate
game4 = TennisGame.new
game4.generate
game5 = TennisGame.new
game5.generate
game6 = TennisGame.new
game6.generate
game7 = TennisGame.new
game7.generate
game8 = TennisGame.new
game8.generate
game9 = TennisGame.new
game9.generate

point1 = TennisPoint.new
point1.generate("0-0", 1)
point2 = TennisPoint.new
point2.generate("15-0", 1)
point3 = TennisPoint.new
point3.generate("30-0", 1)
point4 = TennisPoint.new
point4.generate("40-0", 1)

point5 = TennisPoint.new
point5.generate("0-0", 2)
point6 = TennisPoint.new
point6.generate("15-0", 2)
point7 = TennisPoint.new
point7.generate("30-0", 2)
point8 = TennisPoint.new
point8.generate("40-0", 2)

point9 = TennisPoint.new
point9.generate("0-0", 1)
point9.player_serving = 2
point10 = TennisPoint.new
point10.generate("0-15", 1)
point9.player_serving = 2
point11 = TennisPoint.new
point11.generate("0-30", 1)
point9.player_serving = 2
point12 = TennisPoint.new
point12.generate("0-40", 1)
point9.player_serving = 2

# 1-0
game1.tennis_points_attributes.push(point1)
game1.tennis_points_attributes.push(point2)
game1.tennis_points_attributes.push(point3)
game1.tennis_points_attributes.push(point4)

#1-1
game2.tennis_points_attributes.push(point5)
game2.tennis_points_attributes.push(point6)
game2.tennis_points_attributes.push(point7)
game2.tennis_points_attributes.push(point8)

#2-1
game3.tennis_points_attributes.push(point1)
game3.tennis_points_attributes.push(point2)
game3.tennis_points_attributes.push(point3)
game3.tennis_points_attributes.push(point4)

#2-2
game4.tennis_points_attributes.push(point5)
game4.tennis_points_attributes.push(point6)
game4.tennis_points_attributes.push(point7)
game4.tennis_points_attributes.push(point8)

#3-2
game5.tennis_points_attributes.push(point1)
game5.tennis_points_attributes.push(point2)
game5.tennis_points_attributes.push(point3)
game5.tennis_points_attributes.push(point4)

#4-2 (break)
game6.tennis_points_attributes.push(point9)
game6.tennis_points_attributes.push(point10)
game6.tennis_points_attributes.push(point11)
game6.tennis_points_attributes.push(point12)

#5-2
game7.tennis_points_attributes.push(point1)
game7.tennis_points_attributes.push(point2)
game7.tennis_points_attributes.push(point3)
game7.tennis_points_attributes.push(point4)

#5-3
game8.tennis_points_attributes.push(point5)
game8.tennis_points_attributes.push(point6)
game8.tennis_points_attributes.push(point7)
game8.tennis_points_attributes.push(point8)

#6-3
game9.tennis_points_attributes.push(point1)
game9.tennis_points_attributes.push(point2)
game9.tennis_points_attributes.push(point3)
game9.tennis_points_attributes.push(point4)

set1.tennis_games_attributes.push(game1)
set1.tennis_games_attributes.push(game2)
set1.tennis_games_attributes.push(game3)
set1.tennis_games_attributes.push(game4)
set1.tennis_games_attributes.push(game5)
set1.tennis_games_attributes.push(game6)
set1.tennis_games_attributes.push(game7)
set1.tennis_games_attributes.push(game8)
set1.tennis_games_attributes.push(game9)

match.tennis_sets_attributes.push(set1)

folder_name = "matches/"
file_name = folder_name + match.event_name + DateTime.now.strftime("%Y%m%d%H%M%S") + ".json"
File.open(file_name, 'w') { |file| file.write(match.to_json) }

puts "Match JSON created successfully."