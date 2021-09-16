class AttendantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.attendant_mailer.info.subject
  #
  def info
    @attendant = params[:attendant]
    @event = @attendant.event
    mail(to: @attendant.email, bcc: 'iapnacimientocl@gmail.com', subject: "Tu inscripción fue realizada con éxito! 🎉")
  end

  def info_without_email
    @attendant = params[:attendant]
    @event = @attendant.event
    mail(to: 'iapnacimientocl@gmail.com', subject: "Tu inscripción fue realizada con éxito! 🎉")
  end
end
