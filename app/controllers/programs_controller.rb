class ProgramsController < ApplicationController
  layout "admin"
  
  before_action :confirm_logged_in
  

  def index
    @programs = Program.sorted
    if params[:search]
      @programs = Program.search(params[:search]).order("created_at DESC")
    else
      @programs = Program.all.order('created_at DESC')
    end

  end

  def show
    @program = Program.find(params[:id])
  end

  def new
    @program = Program.new
  end
  
  def create
    # Instantiate a new object using form parameters
	@program = Program.new(program_params)
	@categories = Category.where(:id => params[:category])
	@program.categories << @categories
	puts @program.inspect 
	# Save the object
	if @program.save	
	  # If save succeeds, redirect to the index action
	  flash[:notice] = "Program created successfully."
	  redirect_to(:action => 'index') 
	else
	# If save fails, redisplay the form so user can fix problems
	  render('new')
	end
  end
  

  def edit
     @program = Program.find(params[:id])
  end

  def update
  # Find an existing object using form parameters
	@program = Program.find(params[:id])

	
	
	# Update the object
	if @program.update_attributes(program_params)	
	  	@categories = Category.where(:id => params[:category])
        @program.categories.destroy_all   #disassociate the already added categories
        @program.categories << @categories
	  # If update succeeds, redirect to the show action
	  flash[:notice] = "Program updated successfully."
	  redirect_to(:action => 'show', :id => @program.id) 
	else
	# If update fails, redisplay the form so user can fix problems
	  render('edit')
	end
  end  
  
  def delete
    @program = Program.find(params[:id])
  end
 
  def destroy
    program = Program.find(params[:id]).destroy
	flash[:notice] = "Program '#{program.name}' destroyed successfully."
	redirect_to(:action => 'index')
  end
  
 private
    def program_params
	  params.require(:program).permit(:name, :phonenum, :purpose, :website, :agency_id, :shortdesc, :description, :eligibility, :keywords, :email, :pyaddress, :pycity, :pystate, :pyzip, :maddress, :maddress2, :mcity, :mstate, :mzip)
	end
 
  
  
end
