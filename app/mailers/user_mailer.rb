class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    @user = user #On recoupere l'utilisateur

    @url  = 'http://monsite.fr/login' #L'url de Mon site/login

    #Envoyer le mail
    mail(to: @user.email, subject: 'Bienvenue sur Eventbrite THP !') 
  end
end
