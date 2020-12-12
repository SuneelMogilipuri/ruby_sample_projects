class ContactsController < ApplicationController
    skip_before_action :verify_authenticity_token 
    def new
        @contact = Contact.new()
    end

    def create
        @contact = Contact.new(permitted_params)
        @contact.save
        respond_to do |format|   
            if @contact.save   
                ContactMailer.with(contact: @contact).new_contact_email.deliver
                format.html { redirect_to contact_url, notice: 'Contact was successfully created.' }   
                format.json { render :show, status: :created, location: @contact }   
            else   
                format.html { render :new }   
                format.json { render json: @contact.errors, status: :unprocessable_entity }   
            end 
        end
    end
    private
        def permitted_params
            params.permit(:first_name, :last_name, :email, :phone_number, :message)
        end
end
