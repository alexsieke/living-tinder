class DealTagsController < ApplicationController

  # GET /deal_tags/new
  def new
    if session[:current_user_id].nil?
      redirect_to root_path
    end

    @tag_categories = Tag.uniq.pluck(:category)

    @deal_tag = DealTag.new
    @maxtime = Deal.maximum('created_at') - 1.day

    if !params[:deal_id].blank?
      @deal = Deal.find(params[:deal_id])
      if @deal.nil?
        @deal = Deal.where('created_at >= ?', @maxtime).first(:order => "RANDOM()")
      end
    else
       @deal = Deal.where('created_at >= ?', @maxtime).first(:order => "RANDOM()")
    end

  end

  # POST /deal_tags
  # POST /deal_tags.json
  def create

    begin 
      @tags = JSON.parse(params[:deal_tag][:json])
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
