class EmailsController < ApplicationController
  # GET /emails
  # GET /emails.xml
  def index
    @emails = Email.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emails }
    end
  end

  # GET /emails/1
  # GET /emails/1.xml
  def show
    @email = Email.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @email }
    end
  end

  # GET /emails/new
  # GET /emails/new.xml
  def new
    if params[:batch_id]
      @batch = Batch.find(params[:batch_id])
      @email = Email.new
      @batch_id = params[:batch_id]
    end


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @email }
    end
  end

  def create
    @email = Email.new(params[:email])
    sender= current_user.email
    recipients = Array.new
    recipients = @email.batches.first.students.map {|student| student.email} if @email.students?
    recipients+= @email.batches.first.guardians.map {|guardian| guardian.email} if @email.guardians?
    recipients+= @email.batches.first.employees.map {|employee| employee.email} if @email.employees?
    recipients = recipients.uniq
    if !(recipients.count == 1 && recipients[0] == "")
      if @email.save 
        SchoolMailer.send_email(sender, recipients, @email.subject, @email.content).deliver
        redirect_to(@email, :notice => 'Email was successfully created.')
      else
        redirect_to :action => "index" 
      end
    else
      redirect_to :action => "index"
    end
  end


  # DELETE /emails/1
  # DELETE /emails/1.xml
  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html { redirect_to(emails_url) }
      format.xml  { head :ok }
    end
  end
end
