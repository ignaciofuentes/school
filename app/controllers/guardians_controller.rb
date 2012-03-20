class GuardiansController < ApplicationController
  
filter_resource_access

  def index
    @search = Guardian.search(params[:search])
    @guardians = @search.all
  end

  

  def edit

  end

  def update

  end

  def show    
   @guardian = Guardian.find(params[:id])
  end

  def destroy

  end

end