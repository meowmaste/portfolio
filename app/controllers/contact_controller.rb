class ContactController < ApplicationController
  def new
    @message = Message.new 
  end 

  def create
    @message = Message.new(message_params)

    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Message was sent!")
    else 
      flash.now.alert = "Please fill out all fields."
      render :new
    end 
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :body)
  end 

end
