class ContactsController < ApplicationController

  def new
  	@contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
	    flash[:success] = "Thank you, your message has been sent successfully. I will be in touch soon!"
      redirect_to contact_path
    else
	    flash[:error] = "Cannot send message. Please try again."
	    render :new
    end
  end

end
