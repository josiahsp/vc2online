class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.new_contact.subject
  #
  def new_contact(contact)
    @contact = contact

    mail to: contact.email, subject: "We received your info"
  end
  
  def new_contact_office(contact)
    @contact = contact
    
    mail to: vc2office@gmail.com, subject: "New Contact on VC2Online.com"
    
  end
end
