class SessionsController < ApplicationController

  def new
    @title = "Sign In"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      if(params[:remember] == "1")
			sign_in_remember user
		else
			sign_in_not_remembered user
		end
		redirect_back_or "/myresumes"
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end