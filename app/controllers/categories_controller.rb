class CategoriesController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  
  def index
	@categories = Category.sorted
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end
  
  def create
    # Instantiate a new object using form parameters
	@category = Category.new(category_params)
	# Save the object
	if @category.save	
	  # If save succeeds, redirect to the index action
	  flash[:notice] = "Category created successfully."
	  redirect_to(:action => 'index') 
	else
	# If save fails, redisplay the form so user can fix problems
	  render('new')
	end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    # Find an existing object using form parameters
	@category = Category.find(params[:id])
	
	# Update the object
	if @category.update_attributes(category_params)	
	  # If update succeeds, redirect to the show action
	  flash[:notice] = "Category updated successfully."
	  redirect_to(:action => 'show', :id => @category.id) 
	else
	# If update fails, redisplay the form so user can fix problems
	  render('edit')
	end
  end  
  
  
  def delete
    @category = Category.find(params[:id])
  end
 
  def destroy
    category = Category.find(params[:id]).destroy
	flash[:notice] = "Category '#{category.name}' destroyed successfully."
	redirect_to(:action => 'index')
  end
  
  private
    def category_params
	  # same as using "params[:category]", except that it:
	  # - raises an error if :subject is not present
	  #- allows listed attributes to be mass-assigned
	  params.require(:category).permit(:name, :description)
	end
 
end
