class Header < ActiveRecord::Base
	dragonfly_accessor :image do 

		storage_options do |a|
			{ path: "/header/#{a.width}" }
		end
	end
end