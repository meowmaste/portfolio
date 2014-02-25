class NotificationsMailer < ActionMailer::Base
  default from: "from@example.com"
  default to: "jrosbrook@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[www.joslynrosbrook.com] #{message.subject}")
  end 

end