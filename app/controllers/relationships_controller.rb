class RelationshipsController < ApplicationController

#filter_resource_access :nested_in => :students
 def index    
    @student = Student.find(params[:student_id])
    @guardians = @student.guardians
  end
  
  def new
  @student = Student.find(params[:student_id])
	@relationship=@student.relationships.build
	@guardian = @relationship.build_guardian
	@guardian.build_user
	end

  def create
  @student = Student.find(params[:student_id])
	@relationship=@student.relationships.build(params[:relationship])
    if @relationship.save
      flash[:notice] = 'Guardian added successfully.'
      redirect_to student_relationships_path(@student)
    else
      render 'new'
    end
  end
  
  def edit
  @student = Student.find(params[:student_id])
 	@relationship=@student.relationships.find(params[:id])
 	@guardian = @relationship.guardian
 	end
 	
 	def update
  @student = Student.find(params[:student_id])
 	@relationship=@student.relationships.find(params[:id])
     if @relationship.update_attributes(params[:relationship])
       flash[:notice] = 'Guardian edited successfully.'
       redirect_to student_relationships_path(@student)
     else
       render 'new'
     end
   end
 	
  
  def add_relationship
    @student = Student.find(params[:student_id])
     
    @search = Guardian.search(params[:search])
    @guardians = @search.all
  end
  

  
end
