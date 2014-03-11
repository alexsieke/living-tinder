class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end


  # POST /users
  # POST /users.json
  def create

    @user = User.new(:name => user_params[:name], :dob => user_params[:dob], :gender => params[:gender])

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        session[:current_user_name] = @user.name

        format.html { redirect_to new_tinder_path }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :dob, :gender)
    end
end
