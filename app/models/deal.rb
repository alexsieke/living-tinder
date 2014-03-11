class Deal < ActiveRecord::Base
	validates_uniqueness_of :deal_id
end
