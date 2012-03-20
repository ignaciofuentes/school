class PeriodsController < ApplicationController
 
  def index
    @periods = Period.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @periods }
    end
  end

 
  def show
    @period = Period.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @period }
    end
  end

  def new
    @period = Period.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @period }
    end
  end

  # GET /periods/1/edit
  def edit
    @period = Period.find(params[:id])
    @evaluation_structure = EvaluationStructure.find(params[:evaluation_structure_id])
  end

  def update
    @evaluation_structure = EvaluationStructure.find(params[:evaluation_structure_id])
    @period = Period.find params[:id]
    @period.update_attributes(params[:period])
  end


  def create
    @evaluation_structure = EvaluationStructure.find(params[:evaluation_structure_id])
    @period = @evaluation_structure.periods.build(params[:period])
    @period.save
  end

 
  def destroy
    @evaluation_structure = EvaluationStructure.find(params[:evaluation_structure_id])
    @period = Period.find(params[:id])
    @period.destroy
    redirect_to @evaluation_structure
  end
end
