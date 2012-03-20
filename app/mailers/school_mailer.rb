class SchoolMailer < ActionMailer::Base


  def send_email(sender,recipients, subject, message)
    @email_subject = subject
    @message = message

    mail(:to => recipients, :subject => subject, :from => sender)
  end
end
