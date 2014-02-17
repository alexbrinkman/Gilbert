class FileWriter

	def self.create(match)
		folder_name = "matches/"
		file_name = folder_name + match.event_name + DateTime.now.strftime("%Y%m%d%H%M%S") + ".json"
		File.open(file_name, 'w') { |file| file.write(match.to_json) }
		puts "Match JSON created successfully."
	end

end