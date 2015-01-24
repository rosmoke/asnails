class News < ActiveRecord::Base
	dragonfly_accessor :image
	acts_as_voteable
end
