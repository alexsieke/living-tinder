class Tag < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :category
end
