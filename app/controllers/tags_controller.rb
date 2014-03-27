class TagsController < ApplicationController

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all.order(:category => :asc, :name => :asc)
    @tag = Tag.new
    @categories = Tag.uniq.pluck(:category)
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag Saved"
    else
      flash[:error] = "Tag not saved"
    end
    redirect_to tags_path
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :category)
    end
end
