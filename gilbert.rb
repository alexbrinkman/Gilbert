require './lib/match'
require './lib/tennis_set'
require 'rubygems'
require 'active_support/all'

match = Match.new
match.event_name = "Test Match Name"

set1 = TennisSet.new
set1.set_number = 1
set2 = TennisSet.new
set2.set_number = 2

match.tennis_sets_attributes = []
match.tennis_sets_attributes.push(set1)
match.tennis_sets_attributes.push(set2)

puts match.to_json