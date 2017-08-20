class AgenciesController < ApplicationController
  
  layout "admin"
  
  before_action :confirm_logged_in
  
  def index
	@agencies = Agency.sorted
  end

  def show
    @agency = Agency.find(params[:id])
  end

  def new
    @agency = Agency.new
  end
  
  def create
    # Instantiate a new object using form parameters
	@agency = Agency.new(agency_params)
	# Save the object
	if @agency.save	
	  # If save succeeds, redirect to the index action
	  flash[:notice] = "Agency created successfully."
	  redirect_to(:action => 'index') 
	else
	# If save fails, redisplay the form so user can fix problems
	  render('new')
	end
  end

  def edit
    @agency = Agency.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
	@agency = Agency.find(params[:id])
	
	# Update the object
	if @agency.update_attributes(agency_params)	
	  # If update succeeds, redirect to the show action
	  flash[:notice] = "Agency updated successfully."
	  redirect_to(:action => 'show', :id => @agency.id) 
	else
	# If update fails, redisplay the form so user can fix problems
	  render('edit')
	end
  end  
  
  
  def delete
    @agency = Agency.find(params[:id])
  end
 
  def destroy
    agency = Agency.find(params[:id]).destroy
	flash[:notice] = "Agency '#{agency.name}' destroyed successfully."
	redirect_to(:action => 'index')
  end
  
  private
    def agency_params
	  # same as using "params[:agency]", except that it:
	  # - raises an error if :subject is not present
	  #- allows listed attributes to be mass-assigned
	  params.require(:agency).permit(:name, :phonenum, :purpose, :website)
	end
 



 
end
