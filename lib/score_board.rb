class ScoreBoard

	def next_score(current_score, won_by)

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

end