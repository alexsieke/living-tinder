class Dma < ActiveRecord::Base
	validates_uniqueness_of :name
end
