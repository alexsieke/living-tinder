class DealsController < ApplicationController

	def show
	end

	def index
		@deals = Deal.all
	end

end
