class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def inscrption_email(user,event)
  	@event = event #on recoupere l'événement 
    @user = user  

    @url  = 'http://monsite.fr/event' #L'url de Mon site/login

    #Envoyer le mail
    mail(to: @user.email, subject: 'Inscription à un événement !') 
  end
end
