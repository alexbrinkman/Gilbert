require 'spec_helper'
require 'match'

describe Match do
	it 'should have an event name' do
		match = Match.new
		match.event_name.should == "Auto Match"
	end
end