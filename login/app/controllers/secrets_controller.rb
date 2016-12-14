class SecretsController < ApplicationController
   before_action :set_secret, only: [:update, :destroy]

  def index
  	@secrets = Secret.all
  	@like = Like.new
  	@user = User.find(session[:user_id])
  end

  def destroy
    @secret.destroy
    redirect_to :controller => 'user', :action => 'show', :id => session[:user_id]
    
  end

  def create
  	@secret = Secret.new(secret_params)

      if @secret.save
         redirect_to :controller => 'user', :action => 'show', :id => session[:user_id]
      else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :controller => 'user', :action => 'show', :id => session[:user_id]
  	  end
  end
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secret
      @secret = Secret.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secret_params
      params.require(:secret).permit(:content, :user_id)
    end
  
end

