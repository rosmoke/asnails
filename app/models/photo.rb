class Photo < ActiveRecord::Base
	dragonfly_accessor :image do 

		storage_options do |a|
			{ path: "/gallery/#{a.width}" }
		end
	end
end
