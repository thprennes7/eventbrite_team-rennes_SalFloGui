class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def new_attendance_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance
    @user = attendance.user
    @event = attendance.event


    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: "Tu t'es inscrit à l'évènement #{@event.title} !")
  end
end
