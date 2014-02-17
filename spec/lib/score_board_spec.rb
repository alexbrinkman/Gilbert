require 'spec_helper'
require 'score_board'

describe ScoreBoard do

	it 'the point after 0 is 15' do
		score_board = ScoreBoard.new

		score = score_board.next_score("0-0", 1)
		score.should == "15-0"

		score = score_board.next_score("0-0", 2)
		score.should == "0-15"

	end

	it 'the point after 15 is 30' do
		score_board = ScoreBoard.new

		score = score_board.next_score("15-15", 1)
		score.should == "30-15"

		score = score_board.next_score("0-15", 2)
		score.should == "0-30"

	end

	it 'the point after 30 is 40' do
		score_board = ScoreBoard.new

		score = score_board.next_score("30-15", 1)
		score.should == "40-15"

		score = score_board.next_score("30-30", 2)
		score.should == "30-40"

	end

	it 'the point after 40 is game, unless both players are at 40' do
		score_board = ScoreBoard.new

		score = score_board.next_score("40-15", 1)
		score.should == :server_won

		score = score_board.next_score("30-40", 2)
		score.should == :returner_won

		score = score_board.next_score("40-40", 1)
		score.should == "A-40"

		score = score_board.next_score("40-40", 2)
		score.should == "40-A"

	end

	it 'the point after A is game' do
		score_board = ScoreBoard.new

		score = score_board.next_score("A-40", 1)
		score.should == :server_won

		score = score_board.next_score("40-A", 2)
		score.should == :returner_won

		score = score_board.next_score("40-A", 1)
		score.should == "40-40"

		score = score_board.next_score("A-40", 2)
		score.should == "40-40"

	end

end