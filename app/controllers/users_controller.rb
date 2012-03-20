class UsersController < ApplicationController


  def index
    @search = User.search(params[:search])
    @users = @search.all
  end

  def data_table
    search = params[:sSearch]
    result = Student.where("last_name LIKE ?", "%#{search}%").all 
    result += Employee.where("last_name LIKE ?", "%#{search}%").all
    result += Guardian.where("last_name LIKE ?", "%#{search}%").all
    output = Hash.new
    output["sEcho"]= params[:sEcho]
    output["iTotalRecords"]= result.count
    output["iTotalDisplayRecords"]= result.count
    result = result[params[:iDisplayStart].to_i,params[:iDisplayLength].to_i] 

    output["aaData"] = result.map{|u|[u.full_name, u.class.name, "<span class=\"ui-icon ui-icon-disk\" data-authenticatable_id="+u.id.to_s+" data-authenticatable_type="+u.class.name+"></span>"]}

    render :json=> output.to_json

  end

  def new
    @user= User.new

  end

  def change_password

    if request.post?
      @user = current_user
      if User.authenticate?(@user.username, params[:user][:old_password])
        if params[:user][:new_password] == params[:user][:confirm_password]
          @user.password = params[:user][:new_password]
          @user.update_attributes(:password => @user.password,
          :role => @user.role_name
          )
          flash[:notice] = 'Password changed successfully.'
          redirect_to :action => 'dashboard'
        else
          flash[:warn_notice] = '<p>Password confirmation failed. Please try again.</p>'
        end
      else
        flash[:warn_notice] = '<p>The old password you entered is incorrect. Please enter valid password.</p>'
      end
    end
  end

  def user_change_password
    user = User.find_by_username(params[:id])

    if request.post?
      if params[:user][:new_password]=='' and params[:user][:confirm_password]==''
        flash[:warn_notice]= "<p>Password fields cannot be blank!</p>"
      else
        if params[:user][:new_password] == params[:user][:confirm_password]
          user.password = params[:user][:new_password]
          user.update_attributes(:password => user.password,
          :role => user.role_name
          )
          flash[:notice]= "Password has been updated successfully!"
          redirect_to :action=>"edit", :id=>user.username
        else
          flash[:warn_notice] = '<p>Password confirmation failed. Please try again.</p>'
        end
      end


    end
  end

  def create 
    @user = User.new
    @user.accessible = :all if current_user.admin?
    @user.attributes = params[:user]
    if @user.save 
      flash[:notice] = 'User account created!'
      redirect_to :controller => 'users', :action => 'show', :id => @user.id
    else
      flash[:notice] = 'User account not created!'
    end
  end

  def delete
    @user = User.find_by_username(params[:id]).destroy
    flash[:notice] = 'User account deleted!'
    redirect_to :controller => 'users'
  end

  def edit
    @user = User.find(params[:id])
    @current_user = current_user
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'Updated user details successfully.'
      redirect_to @user
    else
      render edit_user_path(@user)
    end
  end

  def forgot_password
    #    flash[:notice]="You do not have permission to access forgot password!"
    #    redirect_to :action=>"login"

    if request.post? and params[:reset_password]
      if user = User.find_by_email(params[:reset_password][:email])
        user.reset_password_code = Digest::SHA1.hexdigest( "#{user.email}#{Time.now.to_s.split(//).sort_by {rand}.join}" )
        user.reset_password_code_until = 1.day.from_now
        user.role = user.role_name
        user.save(false)
        UserNotifier.deliver_forgot_password(user)
        flash[:notice] = "Reset Password link emailed to #{user.email}"
        redirect_to :action => "index"
      else
        flash[:notice] = "No user exists with email address #{params[:reset_password][:email]}"
      end
    end
  end

  def login
   # @institute = Configuration.find_by_config_key("LogoName")
    if request.post? and params[:user]
      @user = User.new(params[:user])
      user = User.find_by_email(@user.email)
      if user and User.authenticate?(@user.email, @user.password)
        session[:user_id] = user.id
        flash[:notice] = "Welcome, #{user.full_name}!"
        redirect_to root_url
      else
        flash[:notice] = 'Invalid username or password combination'
        render :action =>"login", :layout => "login"
      end
    else
      respond_to do |format|
        format.html { render(:action=> "login", :layout=>"login") }
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = 'Logged out'
    redirect_to :controller => 'users', :action => 'login'
  end

  def show
    if current_user.admin?
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    if @user.nil?
      flash[:notice] = 'User profile not found.'
      redirect_to root_path
    end
  end

  def reset_password
    user = User.find_by_reset_password_code(params[:id])
    if user
      if user.reset_password_code_until > Time.now
        redirect_to :action => 'set_new_password', :id => user.reset_password_code
      else
        flash[:notice] = 'Reset time expired'
        redirect_to :action => 'index'
      end
    else
      flash[:notice]= 'Invalid reset link'
      redirect_to :action => 'index'
    end
  end



  def set_new_password
    if request.post?
      user = User.find_by_reset_password_code(params[:id])
      if user
        if params[:set_new_password][:new_password] === params[:set_new_password][:confirm_password]
          user.password = params[:set_new_password][:new_password]
          user.update_attributes(:password => user.password, :reset_password_code => nil, :reset_password_code_until => nil, :role => user.role_name)
          #User.update(user.id, :password => params[:set_new_password][:new_password],
          # :reset_password_code => nil, :reset_password_code_until => nil)
          flash[:notice] = 'Password succesfully reset. Use new password to log in.'
          redirect_to :action => 'index'
        else
          flash[:notice] = 'Password confirmation failed. Please enter password again.'
          redirect_to :action => 'set_new_password', :id => user.reset_password_code
        end
      else
        flash[:notice] = 'You have followed an invalid link. Please try again.'
        redirect_to :action => 'index'
      end
    end
  end


end

