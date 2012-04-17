class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
	@title = @user.name
	
	@title2 = "My Resumes"
	@resume = Resume.find_all_by_userid(params[:id])
	
	#code from DEMO APP
	respond_to do |format|
      format.html 
      format.xml  { render :xml => @resume }
    end
	
  end

  def new
	@user = User.new
    @title = "Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
end