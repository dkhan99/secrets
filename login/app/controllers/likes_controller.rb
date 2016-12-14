class LikesController < ApplicationController
before_action :set_like, only: [:destroy]

def create
	
	@like = Like.new(:user_id => session[:user_id], :secret_id => params[:format])

      if @like.save
         redirect_to "/secrets"
      else
  		flash[:errors] = user.errors.full_messages
  		redirect_to :controller => 'user', :action => 'show', :id => session[:user_id]
  	  end
	
end


def destroy
    
    @like.destroy
    redirect_to "/secrets"
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:secret_id, :user_id)
    end
  
end
