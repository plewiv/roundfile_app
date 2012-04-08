class SectionsController < ApplicationController

  
  def show
	@section = Section.find(params[:id])
	@title = "Show Section"
  end
  
  def new
	@title = "Create a Section"
	@section = Section.new
  end
  
  def create
	#@userID = User.find_by_userid(current_user.userid)
	
    @section = current_user.sections.build(params[:section])
    if @section.save
      #sign_in @user
      flash[:success] = "Section created!"
      redirect_to @section
    else
      @title = "Create Section"
      render 'new'
    end
  end
  
  def mysections
	@title = "My Sections"
	Section.where("userid = ?", current_user.id)
  end

end
