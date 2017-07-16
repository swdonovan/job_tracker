class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:company_id])
    @contact = @company.contacts.new(contact_params)
    if @contact.save
      redirect_to company_path(@company)
    else
      :back
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
