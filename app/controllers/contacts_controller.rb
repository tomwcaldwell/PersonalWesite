class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    if 
    Contact.new(params[:contact]).deliver
    redirect_to '/contacts/thanks', :alert => ["Yeah!"]
    end
   else

   end


   def create
@contact = Contact.new(params[:contact])
    if 
   @contact.valid?
@contact.deliver
   end
   else 
  render :new
  end

end
