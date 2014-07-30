class Movie < ActiveRecord::Base
	validates_presence_of :title, :description, :year_released
end
