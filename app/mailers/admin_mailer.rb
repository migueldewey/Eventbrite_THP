class AdminMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def admin_email(event)
  	@event = event #on recoupere l'événement 
    @admin = event.admin  

    @url  = 'http://monsite.fr/event' #L'url de Mon site/login

    #Envoyer le mail
    mail(to: @admin, subject: 'Inscription à ton événement !') 
  end
end
