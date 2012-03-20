class HomeController < ApplicationController
  
	filter_access_to :all
  
  def index
    @user = current_user
   # @config = Configuration.available_modules
    @employee = Employee.find_by_employee_number(@user.username)
    @employee ||= Employee.first if current_user.admin?
    @student = Student.find_by_unique_id(@user.username)
  end
  
  def hr
  end
  
  def settings
  end
  
  
  def timetable
  end
  
end
