class PagesController < ApplicationController

	def home
    if session[:current_user_id].nil?
      redirect_to root_path
    end

    if session[:finished] == 1
    	@code = session[:turk_seed]
    	reset_session
    end
	end

	def viewdeals
		@deals = Deal.find(1313)
	end

end
