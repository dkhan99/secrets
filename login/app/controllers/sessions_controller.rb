class SessionsController < ApplicationController
  def new
  end

  def destroy
  	# session[:user_id] = nil
    reset_session
  	redirect_to '/sessions/new'
  end



  def create
  	user = User.find_by(email: login_params[:email])

  	if user && user.authenticate(login_params[:password])
  		session[:user_id]=user.id
  		redirect_to :controller => 'user', :action => 'show', :id => session[:user_id]
      # redirect_to "/user/session[:user_id]", id: session[:user_id]
  	else
  		flash[:errors] = "Invalid email or Password"
  		redirect_to '/sessions/new'
  	end
  	
  end

  private
	  def login_params
	  	params.require(:user).permit(:email, :password)
	  end
end
