class User < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :gender
	validates_presence_of :birthyear
end
