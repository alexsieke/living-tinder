class DealTagsController < ApplicationController

  # GET /deal_tags/new
  def new
    if session[:current_user_id].nil?
      redirect_to root_path
    end

    @tag_categories = Tag.uniq.pluck(:category)

    @deal_tag = DealTag.new
    @maxtime = DateTime.now

    @num_deals = DealStat.where(:user_id => session[:current_user_id]).distinct.count(:deal_id)
    @tagged_deals = DealTag.select(:deal_id).where(:user_id => session[:current_user_id]).uniq

    if @num_deals >= 25
      session[:finished] = 1
      redirect_to home_path
    end

    if !params[:deal_id].blank?
      @deal = Deal.find(params[:deal_id])
    else
      @deals = Deal.find_by_sql ["Select * from deals where offer_ends_at <= ? and id not in (select distinct(deal_id) from deal_tags where user_id = #{session[:current_user_id]}) order by random()", @maxtime ]
      @deal = @deals[0]
    end

  end

  # POST /deal_tags
  # POST /deal_tags.json
  def create

    puts "%%%%%%%%%%%%%%%%%%%%%%%%%"
    puts params.to_yaml
    puts "%%%%%%%%%%%%%%%%%%%%%%%%%"

    begin
      @tags = JSON.parse(params[:deal_tag][:json])
      DealStat.create(:user_id => session[:current_user_id], :deal_id => params[:deal_tag][:deal_id], :time => params[:deal_tag][:duration], :num_tags => @tags.count)

      @tags.each do |t|
        DealTag.create(:user_id => session[:current_user_id], :deal_id => params[:deal_tag][:deal_id], :tag_id => t)
      end

      redirect_to new_deal_tag_path
    rescue
      flash[:error] = "Need to Add At Least 1 Tag"
      redirect_to new_deal_tag_path(:deal_id => params[:deal_tag][:deal_id])
    end
    

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def deal_tag_params
      params.require(:deal_tag).permit(:deal_id, :tag_id, :user_id)
    end
end
