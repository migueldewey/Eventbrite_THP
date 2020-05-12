class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def inscrption_email(user)
  	@event = Attendance.event #on recoupere l'événement 
    @user_admin = event.admin #On recoupere l'admin pour lui prévenir 
    @user_guest = event.guest 

    @url  = 'http://monsite.fr/event' #L'url de Mon site/login

    #Envoyer les mails
    mail(to: @user_admin.email, subject: 'Inscription à ton événement !') 
    mail(to: @user_guest.email, subject: 'Inscription à un événement !') 
  end
end
