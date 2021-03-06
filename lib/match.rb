class Match
	attr_accessor :event_date, :event_name,
	:player_1_id, :player_2_id, :player_3_id,:player_4_id,
	:number_of_sets, :number_of_sets_text,
	:is_doubles, :no_ad_scoring, :match_text,:mts_version,
	:lat_coord, :long_coord, :thedevice, :won_by,:tennis_sets_attributes

	def initialize
		@event_date = DateTime.now.strftime("%b %e, %G") # "Dec 19, 2013"
		@event_name = "Auto Match"
		@player_1_id = 214
		@player_2_id = 215
		@player_3_id = nil
		@player_4_id = nil
		@number_of_sets_text = "3rd Set w/ Tiebreak"
		@is_doubles = false
		@no_ad_scoring = false
		@match_text = "This was an epic auto generated match"
		@mts_version = "3.0.4"
		@lat_coord = 37.78584
		@long_coord = -122.4064
		@thedevice = ""
		@won_by = 1
		@tennis_sets_attributes = []
	end
end