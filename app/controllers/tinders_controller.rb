class TindersController < ApplicationController

  # GET /tinders/new
  def new
    @tinder = Tinder.new
    @left = Deal.first(:order => "RANDOM()")
    @right = Deal.last(:order => "RANDOM()")
  end

  # POST /tinders
  # POST /tinders.json
  def create
    @tinder = Tinder.new(tinder_params)
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
