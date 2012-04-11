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
  
  def allsections
	@title = "All Sections"
	@section = Section.all
	
	#code from DEMO APP
	respond_to do |format|
      format.html
      format.xml  { render :xml => @section }
    end
  end
	
  def mysections
	@title = "My Sections"
	@section = Section.find_all_by_userid(current_user.id)
	
	
	#code from DEMO APP
	respond_to do |format|
      format.html 
      format.xml  { render :xml => @section }
    end
  end
  
  
  
  def edit
	@title = "Edit Section"

    @section = Section.find(params[:id])
  end
  
  def update
	@title = "Edit Section"

    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to(@section, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @section.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
	@title = "Delete Section"

    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to(mysections_url) }
      format.xml  { head :ok }
    end
  end

end
