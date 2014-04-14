class UsersController < ApplicationController

  # GET /users/new
  def new
    if !session[:current_user_id].nil?
      redirect_to home_path
    end
    @user = User.new
    @years = (1950..2000)
    @selected = 1985
  end


  # POST /users
  # POST /users.json
  def create
    @years = (1950..2000)
    @selected = user_params[:birthyear]

    @user = User.new(:name => user_params[:name], :birthyear => user_params[:birthyear], :gender => params[:gender])

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        session[:current_user_name] = @user.name
        format.html { redirect_to new_deal_tag_path }
      else
        format.html { render action: 'new' }
      end
    end
  end

  def destroy
    reset_session
    redirect_to home_path
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :birthyear, :gender)
    end
end
