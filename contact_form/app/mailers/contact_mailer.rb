class ContactMailer < ApplicationMailer
    def new_contact_email
        @contact = params[:contact]
        # info@ajackus.com
        mail(to: 'alekyavellanki1997@gmail.com', subject: "You got a new Contact!")
    end
end
