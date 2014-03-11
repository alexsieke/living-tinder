class TindersController < ApplicationController

  # GET /tinders/new
  def new
    if session[:current_user_id].nil?
      redirect_to root_path
    end
    @tinder = Tinder.new
    @maxtime = Deal.maximum('created_at') - 1.day
    @left = Deal.where('created_at >= ?', @maxtime).first(:order => "RANDOM()")
    @right = Deal.where('created_at >= ?', @maxtime).last(:order => "RANDOM()")
  end

  # POST /tinders
  # POST /tinders.json
  def create
    @tinder = Tinder.new(tinder_params)
    @tinder.user_id = session[:current_user_id]
    
    if @tinder.save
      redirect_to new_tinder_path
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tinder_params
      params.require(:tinder).permit(:winner_id, :loser_id)
    end
end
