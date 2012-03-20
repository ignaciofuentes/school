class CompetencesController < ApplicationController

  def index
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @batch = @batch_subject.batch
    @competences = @batch_subject.competences
  end

  def show
    @competence = Competence.find(params[:id])
  end


  def new
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @periods = @batch_subject.batch.evaluation_structure.periods
    @competence = @batch_subject.competences.build
  end


  def edit
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @periods = @batch_subject.batch.evaluation_structure.periods
    @competence = @batch_subject.competences.find(params[:id])
  end

  def create
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @competence = @batch_subject.competences.build(params[:competence])

    respond_to do |format|
      if @competence.save
        format.html { redirect_to(@competence, :notice => 'Competence was successfully created.') }
        format.xml  { render :xml => @competence, :status => :created, :location => @competence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @competence.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @competence = @batch_subject.competences.find(params[:id])
    if @competence.update_attributes(params[:competence])
      redirect_to(@competence, :notice => 'Competence was successfully updated.') 
    else
      render :action => "edit" 
    end
  end


  def destroy
    @batch_subject = BatchSubject.find(params[:batch_subject_id])
    @competence = @batch_subject.competences.find(params[:id])
    @competence.destroy
    redirect_to(batch_subject_competences_path(@batch_subject))
  end

end
