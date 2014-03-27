class PagesController < ApplicationController

	def home
    if session[:current_user_id].nil?
      redirect_to root_path
    end
	end

end
