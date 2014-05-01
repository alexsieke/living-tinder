class Deal < ActiveRecord::Base
	validates_uniqueness_of :deal_id
	has_many :deal_tags
end
