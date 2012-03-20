class SchoolYearsController < ApplicationController
  # GET /school_years
  # GET /school_years.xml
  def index
    @school_years = SchoolYear.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_years }
    end
  end

  # GET /school_years/1
  # GET /school_years/1.xml
  def show
    @school_year = SchoolYear.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_year }
    end
  end

  # GET /school_years/new
  # GET /school_years/new.xml
  def new
    @school_year = SchoolYear.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_year }
    end
  end

  # GET /school_years/1/edit
  def edit
    @school_year = SchoolYear.find(params[:id])
  end

  # POST /school_years
  # POST /school_years.xml
  def create
    @school_year = SchoolYear.new(params[:school_year])

    respond_to do |format|
      if @school_year.save
        format.html { redirect_to(@school_year, :notice => 'School year was successfully created.') }
        format.xml  { render :xml => @school_year, :status => :created, :location => @school_year }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_year.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /school_years/1
  # PUT /school_years/1.xml
  def update
    @school_year = SchoolYear.find(params[:id])

    respond_to do |format|
      if @school_year.update_attributes(params[:school_year])
        format.html { redirect_to(@school_year, :notice => 'School year was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_year.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /school_years/1
  # DELETE /school_years/1.xml
  def destroy
    @school_year = SchoolYear.find(params[:id])
    @school_year.destroy

    respond_to do |format|
      format.html { redirect_to(school_years_url) }
      format.xml  { head :ok }
    end
  end
end
