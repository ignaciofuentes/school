class EvaluationStructuresController < ApplicationController
  
  def index
    @evaluation_structures = EvaluationStructure.all
  end

 
  def show
    @evaluation_structure = EvaluationStructure.find(params[:id])
    @periods = @evaluation_structure.periods
  end


  def new
    @evaluation_structure = EvaluationStructure.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @evaluation_structure }
    end
  end

  
  def edit
    @evaluation_structure = EvaluationStructure.find(params[:id])
  end

  
  def create
    @evaluation_structure = EvaluationStructure.new(params[:evaluation_structure])

    respond_to do |format|
      if @evaluation_structure.save
        format.html { redirect_to(@evaluation_structure, :notice => 'Evaluation stucture was successfully created.') }
        format.xml  { render :xml => @evaluation_structure, :status => :created, :location => @evaluation_structure }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @evaluation_structure.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def update
    @evaluation_structure = EvaluationStructure.find(params[:id])

    respond_to do |format|
      if @evaluation_structure.update_attributes(params[:evaluation_structure])
        format.html { redirect_to(@evaluation_structure, :notice => 'Evaluation stucture was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @evaluation_structure.errors, :status => :unprocessable_entity }
      end
    end
  end

 
  def destroy
    @evaluation_structure = EvaluationStructure.find(params[:id])
    @evaluation_structure.destroy

    respond_to do |format|
      format.html { redirect_to(evaluation_structures_url) }
      format.xml  { head :ok }
    end
  end
end
