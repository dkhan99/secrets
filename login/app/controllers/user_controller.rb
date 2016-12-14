class UserController < ApplicationController
  def new
  end

  def show
    if params[:id] == session[:user_id].to_s
      @user = User.find_by(id: params[:id])
      @secret = Secret.new
      @secrets = Secret.where(user_id: params[:id])
      # @allsecrets = Secret.all
      # @allsecrets = Secret.where(likes: params[:id])

    else
      redirect_to :controller => 'user', :action => 'show', :id => session[:user_id]
    end
      
  end

  def create
  	user = User.new(user_params)

  	if user.save
  		session[:user_id]=user.id
  		redirect_to "/secrets"
  	else
  		flash[:errors] = user.errors.full_messages
  		redirect_to "/user/new"
  	end
  	
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
